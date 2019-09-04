//
//  Enumeration.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

public protocol Enumeration: RowEnumerated, CaseIterable { }

public typealias RowEnumeration = Enumeration

public protocol SectionEnumeration: Enumeration, SectionEnumerated { }
