//
//  Enumerated.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

/// The base protocol of EnumeratedRow and EnumeratedSection.
public protocol Enumerated {
    
    
    var Enumeration: Enumerated.Type { get }
    
    /// Same as `allCases`.
    static var cases: [Enumerated] { get }
    
    /// Initialize a case with the index of its corresponding section or cell.
    ///
    /// Same as `init?(rawValue: Int)`.
    init?(index: Int)
    
    /// The rawValue of the enumeration case, which must belong to an Int enumeration.
    var rawValue: Int { get }
}

public extension Enumerated {
    var Enumeration: Enumerated.Type {
        return Self.self
    }
}

public extension Enumerated where Self: CaseIterable {
    
    static var cases: [Enumerated] {
        return Self.allCases as! [Enumerated]
    }
}

public extension Enumerated where Self: RawRepresentable, Self.RawValue == Int {
    init?(index: Int) {
        guard let `case` = Self.init(rawValue: index) else {
            return nil
        }
        self = `case`
    }
}
