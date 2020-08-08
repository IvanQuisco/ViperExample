//
//  HomeRouter.swift
//  viper
//
//  Created by Ivan Quintana on 08/08/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {

    class func createHomeModule() -> UIViewController {
        let navController = UINavigationController(rootViewController: HomeView())
        if let view = navController.children.first as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let router: HomeRouterProtocol = HomeRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
}
