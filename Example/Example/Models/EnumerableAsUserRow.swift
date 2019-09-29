//
//  EnumerableAsUserRow.swift
//  Example
//
//  Created by iMoe on 2019/9/28.
//  Copyright © 2019 imoe. All rights reserved.
//

import EnumeratedTable

/// Cells can enumerate this type of enumerated row as a user row.
///
/// Use this protocol to help conforming your custom cells to Enumerable.
protocol EnumerableAsUserRow: EnumeratedRow {
    
    var text: String? { get }
    
    var image: UIImage? { get }
}
