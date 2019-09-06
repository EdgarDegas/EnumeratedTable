//
//  ViewController+EnumeratedTable.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import EnumeratedTable

// MARK: Enumerated
extension ViewController: TableEnumerated {
    enum Section: Int, SectionEnumeration {
        case user
        case plain
        case setting
        
        var RowsInSection: RowEnumerated.Type {
            switch self {
            case .user:
                return UserRow.self
            case .plain:
                return SelectableRow.self
            case .setting:
                return RichTextRow.self
            }
        }
        
        var titleForHeader: String? {
            switch self {
            case .user:
                return nil
            case .plain:
                return "Selectable Cells"
            case .setting:
                return "Rich Text Cells"
            }
        }
    }
    
    enum UserRow: Int, RowEnumeration {
        case avatar
        case biography
        
        var reuseIdentifier: String? {
            switch self {
            case .avatar:
                return "Avatar Cell"
            case .biography:
                return "Cell"
            }
        }
        
        var text: String? {
            switch self {
            case .avatar:
                return "iMoe"
            case .biography:
                return "A developer."
            }
        }
        
        var image: UIImage? {
            guard self == .avatar else { return nil }
            return UIImage(named: "Avatar")
        }
    }
    
    enum SelectableRow: Int, RowEnumeration {
        case about
        case githubRepo
        
        var reuseIdentifier: String? {
            return "Cell"
        }
        
        var text: String? {
            switch self {
            case .about:
                return "About EnumeratedTable"
            case .githubRepo:
                return "GitHub Repository"
            }
        }
        
        var height: CGFloat? {
            return 56
        }
    }
    
    enum RichTextRow: Int, RowEnumeration {
        case row1
        case row2
        
        var text: String? {
            switch self {
            case .row1:
                return "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            case .row2:
                return "Ut enim ad minim veniam."
            }
        }
        
        var reuseIdentifier: String? {
            return "Rich Cell"
        }
        
        var headline: String {
            switch self {
            case .row1:
                return "Row 1"
            case .row2:
                return "Row 2"
            }
        }
        
        var subhead: String {
            switch self {
            case .row1:
                return "Subhead 1"
            case .row2:
                return "Subhead 2"
            }
        }
    }
}

extension RichTextTableViewCell: Enumerable {
    func configure(using enumerated: RowEnumerated) {
        let enumerated = enumerated as! ViewController.RichTextRow
        headlineLabel.text = enumerated.headline
        subheadLabel.text = enumerated.subhead
        bodyLabel.text = enumerated.text
    }
}

extension AvatarTableViewCell: Enumerable {
    func configure(using enumerated: RowEnumerated) {
        let enumerated = enumerated as! ViewController.UserRow
        nameLabel.text = enumerated.text
        avatarImageView.image = enumerated.image
    }
}
