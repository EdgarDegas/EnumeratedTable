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
            switch self {
            case .section1:
                return PlainRow.self
            case .section2:
                return RichTextRow.self
            }
        }
    }
    
    enum PlainRow: Int, RowEnumeration {
        case row1
        case row2
        
        var reuseIdentifier: String? {
            return "Cell"
        }
        
        var text: String? {
            switch self {
            case .row1:
                return "row1"
            case .row2:
                return "row2"
            }
        }
    }
    
    enum RichTextRow: Int, RowEnumeration {
        case row1
        case row2
        
        var text: String? {
            switch self {
            case .row1:
                return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            case .row2:
                return "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
            }
        }
        
        var reuseIdentifier: String? {
            return "Rich Cell"
        }
        
        var headline: String {
            switch self {
            case .row1:
                return "Row 1"
            case .row2:
                return "Row 2"
            }
        }
        
        var subhead: String {
            switch self {
            case .row1:
                return "Subhead 1"
            case .row2:
                return "Subhead 2"
            }
        }
    }
}

extension RichTextTableViewCell: Enumerable {
    func configure(using enumerated: RowEnumerated) {
        let enumerated = enumerated as! ViewController.RichTextRow
        headlineLabel.text = enumerated.headline
        subheadLabel.text = enumerated.subhead
        bodyLabel.text = enumerated.text
    }
}


extension TableViewCell: Enumerable { }
