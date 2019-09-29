//
//  StaticTableViewController.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

final class StaticTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var records = Record.samples
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        clearSelection()
    }
}


// MARK: Table View Data Source
extension StaticTableViewController: UITableViewDataSource {
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
extension StaticTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return enumeratedSection(at: section)?.titleForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return enumeratedRow(at: indexPath)?.height ?? UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleSelection(at: indexPath, by: self)
    }
}


// MARK: - Helpers
private extension StaticTableViewController {
    func clearSelection() {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}
