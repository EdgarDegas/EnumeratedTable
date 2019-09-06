//
//  TableEnumerated.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/5.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

public protocol TableEnumerated {
    associatedtype Section: SectionEnumeration where Section: RawRepresentable, Section.RawValue == Int
    
    var tableView: UITableView! { get }
    
    var numberOfEnumeratedSections: Int { get }
    
    func numberOfEnumeratedRows(in section: Int) -> Int
    
    func enumeratedRow(at indexPath: IndexPath) -> RowEnumerated?
    
    func dequeueEnumerableCell(
        for row: RowEnumerated,
        at indexPath: IndexPath,
        inside tableView: UITableView
    ) -> Enumerable?
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
}
