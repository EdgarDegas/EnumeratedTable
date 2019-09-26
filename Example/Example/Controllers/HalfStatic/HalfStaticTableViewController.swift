//
//  HalfStaticTableViewController.swift
//  Example
//
//  Created by iMoe on 2019/9/4.
//  Copyright © 2019 imoe. All rights reserved.
//

import UIKit

final class HalfStaticTableViewController: UIViewController {
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
extension HalfStaticTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfEnumeratedSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let enumeratedSection = enumeratedSection(at: section) as? Section else { return 0 }
        switch enumeratedSection {
        case .richText:
            return records.count
        default:
            return numberOfEnumeratedRows(in: section)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let enumeratedSection = enumeratedSection(
            at: indexPath.section) as? Section
        else {
            return .init()
        }
        switch enumeratedSection {
        case .richText:
            let record = records[indexPath.row]
            let enumeratedRow = enumeratedRowForRecordStyle(record.style)
            let cell = tableView.dequeueReusableCell(
                withIdentifier: enumeratedRow.reuseIdentifier!, for: indexPath)
            configureCell(cell, asRow: enumeratedRow, with: record.record)
            return cell
        default:
            return enumeratedCell(at: indexPath, inside: tableView)
        }
    }
}


// MARK: Table View Delegate
extension HalfStaticTableViewController: UITableViewDelegate {
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
private extension HalfStaticTableViewController {
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
