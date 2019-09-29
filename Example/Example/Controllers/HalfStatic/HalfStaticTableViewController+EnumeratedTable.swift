//
//  HalfStaticTableViewController+EnumeratedTable.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import EnumeratedTable
import SafariServices

// MARK: Enumerations
extension HalfStaticTableViewController: TableEnumerated {
    
    enum Section: Int, SectionEnumeration {
        case user
        case plain
        case richText
        
        var titleForHeader: String? {
            switch self {
            case .user:
                return nil
            case .plain:
                return "Selectable Cells"
            case .richText:
                return "Rich Text Cells"
            }
        }
    }
    
    
    enum UserRow: Int, RowEnumeration, EnumerableAsUserRow {
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

}


// MARK: - Route sections to rows
extension HalfStaticTableViewController.Section {
    var RowsInSection: EnumeratedRow.Type {
        switch self {
        case .user:
            return HalfStaticTableViewController.UserRow.self
        case .plain:
            return HalfStaticTableViewController.SelectableRow.self
        case .richText:
            return RichTextRow.self
        }
    }
}


// MARK: - Reuse Identifiers
extension HalfStaticTableViewController.UserRow {
    var reuseIdentifier: String? {
        switch self {
        case .avatar:
            return "Avatar Cell"
        case .biography:
            return "Cell"
        }
    }
}

extension HalfStaticTableViewController.SelectableRow {
    var reuseIdentifier: String? {
        return "Selectable Cell"
    }
}
