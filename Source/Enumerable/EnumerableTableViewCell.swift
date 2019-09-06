//
//  EnumerableTableViewCell.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/6.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

/// An enumerable UITableViewCell subclass.
///
/// If you plan to enumerate a table containing only cells with iOS built-in basic
/// styles, i.e., UITableViewCell itself instead of subclassing. Then replace
/// UITableViewCell with this class. If you don't want to extend the whole
/// UITableViewCell to Enumerable.
///
/// Elsewise, declare an extension to conform UITableViewCell to Enumerable
/// so that the cells could be configured with enumerated cases.
open class EnumerableTableViewCell: UITableViewCell, Enumerable { }
