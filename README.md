# EnumeratedTable

[![Build Status](https://travis-ci.com/EdgarDegas/EnumeratedTable.svg?branch=master)](https://travis-ci.com/EdgarDegas/EnumeratedTable)
![Swift Version](https://img.shields.io/badge/Swift-5.1-orange?color=ffac45)

An elegant way to layout a static table using Swift enum.

## Preview

Chaos in your setting view controller code? Try enum.

### Enumerate your sections and rows like this.

<img style="text-align:left" src="https://user-images.githubusercontent.com/12840982/64448795-15afc200-d111-11e9-92d5-ce625c4b77cd.png" width="375">

### Outlined by Xcode clearly.

<img style="text-align:left" src="https://user-images.githubusercontent.com/12840982/64448792-15172b80-d111-11e9-9891-f1774b68ef40.png" width="250">

### While keep your view controller clean.

<img style="text-align:left" src="https://user-images.githubusercontent.com/12840982/64448794-15afc200-d111-11e9-9fc1-15c8535c83c6.png" width="400">

### And finally, the table you get.
<img style="text-align:left" src="https://user-images.githubusercontent.com/12840982/64448791-15172b80-d111-11e9-96e5-164f0afe597a.png" width="350">

## Getting Started
### Prerequisites

Install cocoapods if you have not. Then add this line to your podfile:
```
pod 'EnumeratedTable', '~> 0.0.4'
```

### Quick Tutorial

> First of all, consider the Example project in this repository a best practice.

#### 1. Conform your table view controller to TableEnumerated:

```swift
extension ViewController: TableEnumerated {
    // ...
}
```

#### 2. Enumerate your sections:

```swift
extension ViewController: TableEnumerated {
    enum Section: Int, SectionEnumeration {
        case user
        case setting
    }
}
```

#### 3. Enumerate rows for each section:

```swift
extension ViewController: TableEnumerated {
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
        
        var reuseIdentifier: String? {
            switch self {
            case .avatar:
                return "Avatar Cell"
            case .biography:
                return "Cell"
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
        
        var reuseIdentifier: String? {
            return "Rich Cell"
        }
    }
    
    enum Section: Int, SectionEnumeration {
        case user
        case setting
        
        var RowsInSection: RowEnumerated.Type {
            switch self {
            case .user:
                return ViewController.UserRow.self
            case .setting:
                return ViewController.RichTextRow.self
        }
    }
}
```

#### 4. Use shortcut methods to layout your table view:

```swift
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfEnumeratedSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfEnumeratedRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return enumeratedCell(at: indexPath, inside: tableView)
    }
}
```

### Make use of RowEnumeration

#### 1. Besides from text, you can also provide rowHeight in your row enumeration:

```swift
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
    }
```

#### 2. Return the row height in your controller's delegate implementation:

```swift
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return enumeratedRow(at: indexPath)?.height ?? UITableView.automaticDimension
    }
```

### Benefit from Enum

As default, you can provide text, detail (fits in the detail label of a UITableViewCell instance) and height.

But since enumerations are `enum` (of course), you can provide whatever value you want.

#### 1. Provide headline, subhead:
```swift
extension ViewController: TableEnumerated {
    // ...
    
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
        
    // ...
}
```

#### 2. Conform your custom cells to Enumerable:

```swift
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
```

### Handle selection

#### 1. Implement the `handleSelection` method in your row enumeration:

```swift
extension ViewController: TableEnumerated {
    // ...
    
    enum SelectableRow: Int, RowEnumeration {
        case about
        case githubRepo
        
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
    
    // ...
}
```

#### 2. Call the shortcut method in your controller's delegate implementation:
```swift
extension ViewController: UITableViewDelegate {
    // ...
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleSelection(at: indexPath, by: self)
    }
    
    // ...
}
```
