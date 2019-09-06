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
    /// Describe how the cell should be configured.
    func configureEnumerableCell(_ cell: Enumerable)
}

public extension RowEnumerated {

    var text: String? { return nil }
    
    var detail: String? { return nil }
    
    func configureEnumerableCell(_ cell: Enumerable) {
        cell.configure(using: self)
    }
}
