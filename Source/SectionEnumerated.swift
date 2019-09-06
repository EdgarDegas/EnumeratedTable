//
//  SectionEnumerated.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/6.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

/// Describe a section of the table.
public protocol SectionEnumerated: Enumerated {
    
    /// The enumerated rows of the section.
    var RowsInSection: RowEnumerated.Type { get }
    
    /// The title in section header.
    var titleForHeader: String? { get }
    
    /// The title in section footer.
    var titleForFooter: String? { get }
}

public extension SectionEnumerated {
    
    var titleForHeader: String? { return nil }
    
    var titleForFooter: String? { return nil }
}
