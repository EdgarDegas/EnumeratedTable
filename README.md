# EnumeratedTable
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

#### 2. Provide section enumeration:

```swift
extension ViewController: TableEnumerated {
    // ...

    enum Section: Int, SectionEnumeration {
        case user
        case setting
    }
    
    // ...
}
```

#### 3. Provide row enumeration for each section:

```swift
extension ViewController: TableEnumerated {
    // ...

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
    }

    enum RichTextRow: Int, RowEnumeration {
        case row1
        case row2
        
        var reuseIdentifier: String? {
            return "Rich Cell"
        }
    }
    
    // ...
}
```

#### 4. Conform your cells to Enumerable:

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

#### 5. Use convenience methods to layout your table view:

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
