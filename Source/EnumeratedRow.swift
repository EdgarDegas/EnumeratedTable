//
//  EnumeratedRow.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/6.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

/// Describe a row of the table.
public protocol EnumeratedRow: Enumerated {
    
    /// The nib of your custom cell. Defaults to `nil`.
    ///
    /// You don't need to provide both nib and CellType. Only one of them is used.
    var nib: UINib? { get }
    
    /// The type of your custom cell. Defaults to `nil`.
    ///
    /// You don't need to provide both nib and CellType. Only one of them is used.
    var CellType: UITableViewCell.Type? { get }
    
    /// The reuse identifier
    var reuseIdentifier: String? { get }
    
    /// Text in `textLabel` of a row or title of a section.
    var text: String? { get }
    
    /// Text in `detailLabel` of a row.
    var detail: String? { get }
    
    /// The height of the row, or nil to auto layout the cell.
    var height: CGFloat? { get }
    
    @available(*, deprecated,
    message: "Deprecated in 0.0.4. Cells should be configured by Enumerable.")
    /// Deprecated in 0.0.4. Cells should be configured by Enumerable.
    func configureEnumerableCell(_ cell: Enumerable)
    
    /// Describe how the table should behave when cell is selected. Defaults to doing
    /// nothing at all.
    func handleSelection(by viewController: UIViewController)
}

public extension EnumeratedRow {
    
    var nib: UINib? {
        return nil
    }
    
    var CellType: UITableViewCell.Type? {
        return nil
    }

    var text: String? { return nil }
    
    var detail: String? { return nil }
    
    var height: CGFloat? { return nil }
    
    func configureEnumerableCell(_ cell: Enumerable) {
        cell.configure(using: self)
    }
    
    func handleSelection(by viewController: UIViewController) {
        
    }
}


@available(*, deprecated,
message: "Deprecated in 0.0.6. Use EnumeratedRow instead.")
/// Deprecated in 0.0.6. Use EnumeratedRow instead. Or use RowEnumeration if
/// you want to enumerate your rows in one section.
public typealias RowEnumerated = EnumeratedRow
