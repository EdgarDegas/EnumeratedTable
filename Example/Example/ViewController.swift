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
}


// MARK: Table View Data Source
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


// MARK: Table View Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return enumeratedSection(at: section)?.titleForHeader
    }
}
