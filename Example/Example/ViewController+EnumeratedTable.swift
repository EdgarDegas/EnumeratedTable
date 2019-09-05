//
//  ViewController+EnumeratedTable.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import EnumeratedTable

// MARK: Enumerated
extension ViewController: TableEnumerated {
    enum Section: Int, SectionEnumeration {
        case section1
        case section2
        
        var RowsInSection: RowEnumerated.Type {
            return Row.self
        }
    }
    
    enum Row: Int, RowEnumeration {
        case row1
        
        var text: String? {
            return "row1"
        }
    }
}
