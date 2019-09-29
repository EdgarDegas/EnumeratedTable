//
//  DynamicTableViewController.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

final class DynamicTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var records = [RecordViewModel]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        clearSelection()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleData()
        registerEnumeratedCells(inside: tableView)
    }
}


// MARK: Table View Data Source
extension DynamicTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = records[indexPath.row]
        let enumeratedRow = enumeratedRowForRecordStyle(record.style)
        let cell = tableView.dequeueReusableCell(
            withIdentifier: enumeratedRow.reuseIdentifier!, for: indexPath)
        configureCell(cell, asRow: enumeratedRow, with: record.record)
        return cell
    }
}


// MARK: Table View Delegate
extension DynamicTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let record = records[indexPath.row].record
        let alertController = UIAlertController(
            title: record.title,
            message: record.subtitle,
            preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
            self.clearSelection()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}


// MARK: - Helpers
private extension DynamicTableViewController {
    // MARK: Cell Configurations. You can move these methods to your VM
    func enumeratedRowForRecordStyle(_ style: RecordViewModel.Style) -> RichTextRow {
        var enumeratedRow: RichTextRow
        switch style {
        case .normal:
            enumeratedRow = .style1
        case .subtitleAsFootnote:
            enumeratedRow = .style2
        }
        return enumeratedRow
    }
    
    func configureCell(
        _ cell: UITableViewCell,
        asRow enumeratedRow: RichTextRow,
        with record: Record
    ) {
        switch enumeratedRow {
        case .style1:
            configureRichTextStyle1Cell(cell, with: record)
        case .style2:
            configureRichTextStyle2Cell(cell, with: record)
        }
    }
    
    func configureRichTextStyle1Cell(_ cell: UITableViewCell, with record: Record) {
        guard let cell = cell as? RichTextStyle1TableViewCell else { return }
        cell.headlineLabel.text = record.title
        cell.subheadLabel.text = record.subtitle
        cell.bodyLabel.text = record.description
    }
    
    func configureRichTextStyle2Cell(_ cell: UITableViewCell, with record: Record) {
        guard let cell = cell as? RichTextStyle2TableViewCell else { return }
        cell.headlineLabel.text = record.title
        cell.bodyLabel.text = record.description
        cell.footnoteLabel.text = record.subtitle
    }
    
    // MARK: Helpers
    func clearSelection() {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
    /// Load 10 records with random style.
    func loadSampleData() {
        let samples = Record.samples(ofCount: 10)
        records = samples.map {
            RecordViewModel(record: $0, style: .sample)
        }
    }
}
