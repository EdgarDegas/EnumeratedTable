//
//  Record.swift
//  Example
//
//  Created by iMoe on 2019/9/27.
//  Copyright © 2019 imoe. All rights reserved.
//

import Foundation

struct Record {
    var title: String
    var subtitle: String
    var description: String
}


extension Record {
    static func samples(ofCount count: Int) -> [Record] {
        guard count > 0 else { return [] }
        return (1...count).map {
            sampleGenerator(at: $0)
        }
    }
}


private extension Record {
    static func sampleGenerator(at index: Int) -> Record {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        let nsNumber = NSNumber(value: index)
        let ordinalIndex = formatter.string(from: nsNumber) ?? String(index)
        return .init(title: "Title \(index)",
            subtitle: "Subtitle \(index)",
            description: "Description of the \(ordinalIndex) Item")
    }
}
