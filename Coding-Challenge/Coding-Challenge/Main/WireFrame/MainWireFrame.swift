//
//  MainWireFrame.swift
//  Coding-Challenge
//
//  Created by Paolo Ramos Mendez on 4/20/21.
//  
//

import Foundation
import UIKit

class MainWireFrame: MainWireFrameProtocol {

    class func createMainModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "\(MainView.self)")
        if let view = viewController as? MainView {
            let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
            let interactor: MainInteractorInputProtocol & MainRemoteDataManagerOutputProtocol = MainInteractor()
            let localDataManager: MainLocalDataManagerInputProtocol = MainLocalDataManager()
            let remoteDataManager: MainRemoteDataManagerInputProtocol = MainRemoteDataManager()
            let wireFrame: MainWireFrameProtocol = MainWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
