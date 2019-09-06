//
//  Enumeration.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

public protocol Enumeration: Enumerated, CaseIterable { }

public protocol RowEnumeration: RowEnumerated, CaseIterable { }

public protocol SectionEnumeration: SectionEnumerated, CaseIterable { }
