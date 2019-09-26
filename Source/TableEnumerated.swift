//
//  TableEnumerated.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/5.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

/// Conform your controller or view model to enumerate your table view.
///
/// This protocol asks you to provide a SectionEnumeration type, which should be
/// declared as an enum, named `Section`. See `SectionEnumeration` for paradigm.
///
/// The protocol provides several convenience methods. Checkout [the example
/// project](https://github.com/EdgarDegas/EnumeratedTable/tree/master/Example) for
/// paradigm.
public protocol TableEnumerated {
    
    /// The essential of a table. Enumerates all sections the table has.
    associatedtype Section: SectionEnumeration where Section: RawRepresentable, Section.RawValue == Int
    
    /// The number of sections enumerated in Section.
    var numberOfEnumeratedSections: Int { get }
    
    /// Returns the number of rows enumerated in the section enumeration.
    /// - Parameter section: Index of the section.
    func numberOfEnumeratedRows(in section: Int) -> Int
    
    /// Returns the enumeration of the section.
    /// - Parameter section: Index of the section.
    func enumeratedSection(at section: Int) -> EnumeratedSection?
    
    /// Returns the index path of an enumerated row.
    func indexPathOfEnumeratedRow(_ row: EnumeratedRow) -> IndexPath?
    
    /// Returns the enumeration of the row.
    /// - Parameter indexPath: Index path of the row.
    func enumeratedRow(at indexPath: IndexPath) -> EnumeratedRow?
    
    /// Register reusable cells according to your row enumeration(s).
    ///
    /// This method functions only if you have provided both `reuseIdentifier`
    /// and cell info (`CellType` or nib) for each of your enumerated rows.
    func registerEnumeratedCells(inside tableView: UITableView)
    
    @available(*, deprecated,
        message: "Deprecated in 0.0.4. Replace with enumeratedCell(at:inside:) -> UITableViewCell.")
    func dequeueEnumerableCell(
        for row: EnumeratedRow,
        at indexPath: IndexPath,
        inside tableView: UITableView
    ) -> Enumerable?
    
    /// Returns the dequeued and configured reusable cell.
    ///
    /// This method dequeues the cell from the table view using the reusable identifier
    /// your row enumeration provides.
    ///
    /// If the cell related to that reusable identifier conforms to Enumerable, then the
    /// cell returned should already have been configured.
    ///
    /// - Parameters:
    ///     - indexPath: The index path of the cell.
    ///     - tableView: The table view where the cell resides.
    func enumeratedCell(
        at indexPath: IndexPath,
        inside tableView: UITableView
    ) -> UITableViewCell
    
    /// Call this method in `tableView(_:didSelectedRowAt:)`.
    ///
    /// This method invokes the code you provided at the `handleSelection` method in
    /// your row enumeration.
    ///
    /// - Parameters:
    ///     - indexPath: The index path of the cell.
    ///     - viewController: The controller the enumerated row demands to handle the
    ///     selection.
    func handleSelection(at indexPath: IndexPath,
                         by viewController: UIViewController)
}

public extension TableEnumerated {
    var numberOfEnumeratedSections: Int {
        return Section.cases.count
    }
    
    func numberOfEnumeratedRows(in section: Int) -> Int {
        guard let section = Section(index: section) else { return 0 }
        let Row = section.RowsInSection
        return Row.cases.count
    }
    
    func enumeratedSection(at section: Int) -> EnumeratedSection? {
        return Section(index: section)
    }
    
    func enumeratedRow(at indexPath: IndexPath) -> EnumeratedRow? {
        guard let section = Section(index: indexPath.section) else { return nil }
        let Row = section.RowsInSection
        let rows = Row.cases
        guard indexPath.row >= 0 && indexPath.row < rows.count else { return nil }
        return rows[indexPath.row] as? EnumeratedRow
    }
    
    func registerEnumeratedCells(inside tableView: UITableView) {
        Section.allCases.forEach {
            registerCellsInSection($0, inside: tableView)
        }
    }
    
    func indexPathOfEnumeratedRow(_ row: EnumeratedRow) -> IndexPath? {
        let condition: ((Section) -> Bool) = { $0.RowsInSection == row.Enumeration }
        guard let section = Section.allCases.first(where: condition) else {
            return nil
        }
        return .init(row: row.rawValue, section: section.rawValue)
    }
    
    func dequeueEnumerableCell(
        for row: EnumeratedRow,
        at indexPath: IndexPath,
        inside tableView: UITableView
    ) -> Enumerable? {
        guard let reuseIdentifier = row.reuseIdentifier else { return nil }
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier, for: indexPath)
        return cell as? Enumerable
    }
    
    func enumeratedCell(
        at indexPath: IndexPath,
        inside tableView: UITableView
    ) -> UITableViewCell {
        guard let row = enumeratedRow(at: indexPath),
              let identifier = row.reuseIdentifier,
              let enumerable = tableView.dequeueReusableCell(
                  withIdentifier: identifier, for: indexPath) as? Enumerable
        else {
            return .init()
        }
        enumerable.configure(using: row)
        return enumerable as! UITableViewCell
    }
    
    func handleSelection(at indexPath: IndexPath,
                         by viewController: UIViewController) {
        guard let row = enumeratedRow(at: indexPath) else { return }
        row.handleSelection(by: viewController)
    }
}


private extension TableEnumerated {
    func registerCellsInSection(_ section: EnumeratedSection, inside tableView: UITableView) {
        let RowEnumeration = section.RowsInSection.self
        RowEnumeration.cases.forEach {
            guard let enumeratedRow = $0 as? EnumeratedRow else { return }
            guard let reuseIdentifier = enumeratedRow.reuseIdentifier else { return }
            if let nib = enumeratedRow.nib {
                tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
            } else if let CellType = enumeratedRow.CellType {
                tableView.register(CellType, forCellReuseIdentifier: reuseIdentifier)
            }
        }
    }
}
