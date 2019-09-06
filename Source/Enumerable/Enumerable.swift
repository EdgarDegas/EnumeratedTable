//
//  Enumerable.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

public protocol Enumerable {
//    associatedtype Row: RowEnumerated
    func configure(using enumerated: RowEnumerated)
}
