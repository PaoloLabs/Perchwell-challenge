//
//  TableView.swift
//  Coding-Challenge
//
//  Created by Paolo Ramos Mendez on 4/20/21.
//

import UIKit

class TableView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // For using  CustomView in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
    }
    
    // For using CustomView in IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSubView()
    }
    
    // Settings
    private func initSubView() {
        self.initXibSubView()
        self.addConstraints(contentView: self.contentView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "\(CustomTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(CustomTableViewCell.self)")
    }
}

extension TableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "\(CustomTableViewCell.self)") as! CustomTableViewCell
        let frame = CGRect(x: 0.0, y: 0.0, width: self.frame.width, height: 64.0)
        cell.frame = frame
        cell.configureCellView(cellFrame: frame)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell: CustomTableViewCell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {
            cell.setInitialScroll()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
}

