//
//  AvatarTableViewCell+Enumerable.swift
//  Example
//
//  Created by iMoe on 2019/9/28.
//  Copyright © 2019 imoe. All rights reserved.
//

import EnumeratedTable

extension AvatarTableViewCell: Enumerable {
    func configure(using enumerated: EnumeratedRow) {
        guard let enumerated = enumerated as? EnumerableAsUserRow else { return }
        nameLabel.text = enumerated.text
        avatarImageView.image = enumerated.image
    }
}
