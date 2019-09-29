//
//  DynamicTableViewController+EnumeratedTable.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import EnumeratedTable
import SafariServices

// MARK: Enumerations
extension DynamicTableViewController: TableEnumerated {
    
    enum Section: Int, SectionEnumeration {
        case richText
    }
}


// MARK: - Route sections to rows
extension DynamicTableViewController.Section {
    var RowsInSection: EnumeratedRow.Type {
        return RichTextRow.self
    }
}
