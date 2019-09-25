//
//  EnumeratedSection.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/6.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

/// Describe a section of the table.
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

@available(*, deprecated,
message: "Deprecated in 0.0.6. Use EnumeratedSection instead.")
/// Deprecated in 0.0.6. Use EnumeratedSection instead. Or use SectionEnumeration if
/// you want to enumerate your sections in your table.
public typealias SectionEnumerated = EnumeratedSection
