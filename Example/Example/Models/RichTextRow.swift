//
//  RichTextRow.swift
//  Example
//
//  Created by iMoe on 2019/9/29.
//  Copyright © 2019 imoe. All rights reserved.
//

import EnumeratedTable

enum RichTextRow: Int, RowEnumeration {
    case style1
    case style2
}

extension RichTextRow {
    var nib: UINib? {
        switch self {
        case .style1:
            return nil
        case .style2:
            return .init(nibName: "RichTextStyle2TableViewCell", bundle: nil)
        }
    }
    
    var reuseIdentifier: String? {
        switch self {
        case .style1:
            return "RichTextStyle1TableViewCell"
        case .style2:
            return "RichTextStyle2TableViewCell"
        }
    }
    
    func handleSelection(at record: Record, by viewController: UIViewController) {
        
    }
}
