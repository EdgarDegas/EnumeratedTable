//
//  EnumeratedSection.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/6.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

/// Describe a section of the table. Use `SectionEnumeration` instead of directly
/// using this protocol.
public protocol EnumeratedSection: Enumerated {
    
    /// The enumerated rows of the section.
    var RowsInSection: EnumeratedRow.Type { get }
    
    /// The title in section header.
    var titleForHeader: String? { get }
    
    /// The title in section footer.
    var titleForFooter: String? { get }
}

public extension EnumeratedSection {
    
    var titleForHeader: String? { return nil }
    
    var titleForFooter: String? { return nil }
}
