//
//  TableEnumerated.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/5.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

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
    func enumeratedSection(at section: Int) -> SectionEnumerated?
    
    /// Returns the enumeration of the row.
    /// - Parameter indexPath: Index path of the row.
    func enumeratedRow(at indexPath: IndexPath) -> RowEnumerated?
    
    @available(*, deprecated,
        message: "Deprecated in 0.0.4. Replace with enumeratedCell(at:inside:) -> UITableViewCell.")
    func dequeueEnumerableCell(
        for row: RowEnumerated,
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
    
    func enumeratedSection(at section: Int) -> SectionEnumerated? {
        return Section(index: section)
    }
    
    func enumeratedRow(at indexPath: IndexPath) -> RowEnumerated? {
        guard let section = Section(index: indexPath.section) else { return nil }
        let Row = section.RowsInSection
        let rows = Row.cases
        guard indexPath.row >= 0 && indexPath.row < rows.count else { return nil }
        return rows[indexPath.row] as? RowEnumerated
    }
    
    func dequeueEnumerableCell(
        for row: RowEnumerated,
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
              let enumrable = tableView.dequeueReusableCell(
                  withIdentifier: identifier, for: indexPath) as? Enumerable
        else {
            return .init()
        }
        enumrable.configure(using: row)
        return enumrable as! UITableViewCell
    }
}
