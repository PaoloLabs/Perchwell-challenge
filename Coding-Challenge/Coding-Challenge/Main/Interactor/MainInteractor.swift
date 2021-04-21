//
//  MainInteractor.swift
//  Coding-Challenge
//
//  Created by Paolo Ramos Mendez on 4/20/21.
//  
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MainInteractorOutputProtocol?
    var localDatamanager: MainLocalDataManagerInputProtocol?
    var remoteDatamanager: MainRemoteDataManagerInputProtocol?

}

extension MainInteractor: MainRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
