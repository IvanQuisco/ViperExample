//
//  HomeProtocols.swift
//  viper
//
//  Created by Ivan Quintana on 08/08/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    
    func presentData(data: [TrackViewModel])
    func startLoading()
    func stopLoading()
}

protocol HomeRouterProtocol: class {
    // PRESENTER -> ROUTER
    static func createHomeModule() -> UIViewController
}

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func formatedData(data: [TrackViewModel])
}

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    
    func getTracksData()
}

protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    
    func fetchDataFromServer()
    
    func fetchImageFromServer(from url: String, completion: @escaping ((_ data: Data?) -> Void)) 
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func receivedData(data: ItunesResponse)
}

protocol HomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
