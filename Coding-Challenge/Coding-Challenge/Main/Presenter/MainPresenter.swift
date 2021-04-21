//
//  MainPresenter.swift
//  Coding-Challenge
//
//  Created by Paolo Ramos Mendez on 4/20/21.
//  
//

import Foundation

class MainPresenter  {
    
    // MARK: Properties
    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var wireFrame: MainWireFrameProtocol?
    
}

extension MainPresenter: MainPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
