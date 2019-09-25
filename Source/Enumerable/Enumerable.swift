//
//  Enumerable.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

/// Any cell or reusable view that use the enumerated case to configure its
/// subviews.
public protocol Enumerable {
    /// Descibes how to use the enumerated case to render the interface.
    ///
    /// The default implementation configures a table view cell by fit text
    /// inside textLabel and detail inside detailLabel.
    func configure(using enumerated: RowEnumerated)
}

public extension Enumerable where Self: UITableViewCell {
    func configure(using enumerated: RowEnumerated) {
        textLabel?.text = enumerated.text
        detailTextLabel?.text = enumerated.detail
    }
}
