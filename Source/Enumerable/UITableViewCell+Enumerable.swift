//
//  UITableViewCell+Enumerable.swift
//  EnumeratedTable
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

public extension Enumerable where Self: UITableViewCell {
    func configure(using enumerated: RowEnumerated) {
        textLabel?.text = enumerated.text
        detailTextLabel?.text = enumerated.detail
    }
}

//extension UITableViewCell: Enumerable {
//    func configure(using enumerated: RowEnumerated) {
//        textLabel?.text = enumerated.text
//        detailTextLabel?.text = enumerated.detail
//    }
//}

//public extension UITableViewCell {
//    func configureBasicInfo(using enumerated: RowEnumerated) {
//        textLabel?.text = enumerated.text
//        detailTextLabel?.text = enumerated.detail
//    }
//}
