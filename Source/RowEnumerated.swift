//
//  RowEnumerated.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/6.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

/// Describe a row of the table.
public protocol RowEnumerated: Enumerated {
    
    /// The reuse identifier
    var reuseIdentifier: String? { get }
    
    /// Text in `textLabel` of a row or title of a section.
    var text: String? { get }
    
    /// Text in `detailLabel` of a row.
    var detail: String? { get }
    
    /// The height of the row, or nil to auto layout the cell.
    var height: CGFloat? { get }
    
    /// Describe how the cell should be configured.
    func configureEnumerableCell(_ cell: Enumerable)
    
    /// Describe how the table should behave when cell is selected. Defaults to doing
    /// nothing at all.
    func handleSelection(by viewController: UIViewController)
}

public extension RowEnumerated {

    var text: String? { return nil }
    
    var detail: String? { return nil }
    
    var height: CGFloat? { return nil }
    
    func configureEnumerableCell(_ cell: Enumerable) {
        cell.configure(using: self)
    }
    
    func handleSelection(by viewController: UIViewController) {
        
    }
}
