//
//  ViewController+EnumeratedTable.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import EnumeratedTable
import SafariServices

// MARK: - Enumerations
extension ViewController: TableEnumerated {
    
    enum Section: Int, SectionEnumeration {
        case user
        case plain
        case setting
        
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
        
        func handleSelection(by viewController: UIViewController) {
            switch self {
            case .about:
                viewController.performSegue(withIdentifier: "Show About", sender: nil)
            case .githubRepo:
                let url = URL(string: "https://github.com/EdgarDegas/EnumeratedTable")!
                let safariViewController = SFSafariViewController(url: url)
                viewController.present(safariViewController, animated: true)
            }
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


// MARK: - Route sections to rows
extension ViewController.Section {
    var RowsInSection: RowEnumerated.Type {
        switch self {
        case .user:
            return ViewController.UserRow.self
        case .plain:
            return ViewController.SelectableRow.self
        case .setting:
            return ViewController.RichTextRow.self
        }
    }
}


// MARK: - Reuse Identifiers
extension ViewController.UserRow {
    var reuseIdentifier: String? {
        switch self {
        case .avatar:
            return "Avatar Cell"
        case .biography:
            return "Cell"
        }
    }
}

extension ViewController.SelectableRow {
    var reuseIdentifier: String? {
        return "Selectable Cell"
    }
}

extension ViewController.RichTextRow {
    var reuseIdentifier: String? {
        return "Rich Cell"
    }
}


// MARK: - Conform cells to Enumerable
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
