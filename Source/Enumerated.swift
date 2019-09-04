//
//  Enumerated.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

public protocol Enumerated {
    /// Same as `allCases`.
    static var cases: [Enumerated] { get }
    
    /// Text in `textLabel` of a row or title of a section.
    var text: String? { get }
    
    /// Text in `detailLabel` of a row.
    var detail: String? { get }
    
    /// Same as `init?(rawValue: Int)`.
    init?(index: Int)
}

public typealias RowEnumerated = Enumerated

public protocol SectionEnumerated: Enumerated {
    /// The enumerated rows of the section.
    var RowsInSection: RowEnumerated.Type { get }
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

