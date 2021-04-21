//
//  MainView.swift
//  Coding-Challenge
//
//  Created by Paolo Ramos Mendez on 4/20/21.
//  
//

import Foundation
import UIKit

class MainView: UIViewController {

    // MARK: Properties
    var presenter: MainPresenterProtocol?
    var tableView = TableView()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = TableView(frame: self.view.frame);
        self.view.addSubview(self.tableView);
    }
}

extension MainView: MainViewProtocol {
    // TODO: implement view output methods
}
