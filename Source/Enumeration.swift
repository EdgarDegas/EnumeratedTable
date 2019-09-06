//
//  Enumeration.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation


/// Use this protocol to enumerate rows in a section.
///
/// Do declare your enumeration like this:
/// ```swift
/// enum SettingRow: Int, RowEnumeration {
///     // ...
/// }
/// ```
public protocol RowEnumeration: RowEnumerated, CaseIterable { }

/// Use this protocol to enumerate sections in a table.
///
/// Do declare your enumeration like this:
/// ```swift
/// enum Section: Int, SectionEnumeration {
///     // ...
/// }
/// ```
public protocol SectionEnumeration: SectionEnumerated, CaseIterable { }
