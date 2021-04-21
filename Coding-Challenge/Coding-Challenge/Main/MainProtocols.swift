//
//  MainProtocols.swift
//  Coding-Challenge
//
//  Created by Paolo Ramos Mendez on 4/20/21.
//  
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MainPresenterProtocol? { get set }
}

protocol MainWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMainModule() -> UIViewController
}

protocol MainPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var wireFrame: MainWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MainInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol MainInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MainInteractorOutputProtocol? { get set }
    var localDatamanager: MainLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MainRemoteDataManagerInputProtocol? { get set }
}

protocol MainDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MainRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MainRemoteDataManagerOutputProtocol? { get set }
}

protocol MainRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MainLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
