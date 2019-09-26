//
//  RecordViewModel.swift
//  Example
//
//  Created by iMoe on 2019/9/29.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

struct RecordViewModel {
    /// Represents different layouts with same model structure.
    enum Style: CaseIterable {
        /// From top to bottom: Subtitle - Title - Body.
        case normal
        /// From top to bottom: Title - Body - Footnote.
        case subtitleAsFootnote
        
        /// Returns a random style.
        static var sample: Self {
            var generator = SystemRandomNumberGenerator()
            return Self.allCases.randomElement(using: &generator)!
        }
    }
    
    /// Wrapped model.
    var record: Record
    
    /// Describe how the model should be rendered.
    var style: Style
}
