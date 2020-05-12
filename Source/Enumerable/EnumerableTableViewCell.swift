//
//  EnumerableTableViewCell.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/6.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

/// An enumerable `UITableViewCell` subclass.
///
/// If you plan to enumerate a table using the basic `UITableViewCell` type, replace
/// `UITableViewCell` with this class, so that you don't have to conform
/// `UITableViewCell` to `Enumerable`.
open class EnumerableTableViewCell: UITableViewCell, Enumerable { }
