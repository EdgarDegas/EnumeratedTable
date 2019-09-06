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
        guard let row = enumeratedRow(at: indexPath) else { return .init() }
        guard let cell = dequeueEnumerableCell(
            for: row, at: indexPath, inside: tableView)
        else {
            return .init()
        }
        row.configureEnumerableCell(cell)
        return cell as! UITableViewCell
    }
}


// MARK: Table View Delegate
extension ViewController: UITableViewDelegate {
    
}
