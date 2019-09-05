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
}

public extension TableEnumerated {
    var numberOfEnumeratedSections: Int {
        return Section.cases.count
    }
    
    func numberOfEnumeratedRows(in section: Int) -> Int {
        guard let section = Section.init(index: section) else { return 0 }
        let Row = section.RowsInSection
        return Row.cases.count
    }
}
