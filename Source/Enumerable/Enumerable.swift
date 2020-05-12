//
//  Enumerable.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

/// Conform a `UITableViewCell` subclass or any other view, makes it *enumerable*,
/// so that an enumerated table can reuse it.
public protocol Enumerable {
    /// Descibes how to use the enumerated case to render the interface.
    ///
    /// The default implementation configures a table view cell by fit text
    /// inside textLabel and detail inside detailLabel.
    func configure(using enumerated: EnumeratedRow)
}

public extension Enumerable where Self: UITableViewCell {
    func configure(using enumerated: EnumeratedRow) {
        textLabel?.text = enumerated.text
        detailTextLabel?.text = enumerated.detail
    }
}
