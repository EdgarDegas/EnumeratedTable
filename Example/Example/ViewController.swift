//
//  ViewController.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit
import EnumeratedTable

final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


// MARK: Enumerated
extension ViewController {
    enum Section: Int, SectionEnumeration {
        case section1
        case section2
        
        var RowsInSection: RowEnumerated.Type {
            return Row.self
        }
    }
    
    enum Row: Int, RowEnumeration {
        case row1
        
        var text: String? {
            return "row1"
        }
    }
}

// MARK: Table View Data Source
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.cases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = Section(index: section)!
        return section.RowsInSection.cases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row(index: indexPath.row)!
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = row.text
        return cell
    }
}

// MARK: Table View Delegate
extension ViewController: UITableViewDelegate {
    
}
