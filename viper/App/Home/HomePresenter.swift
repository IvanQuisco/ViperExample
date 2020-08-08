//
//  HomePresenter.swift
//  viper
//
//  Created by Ivan Quintana on 08/08/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.startLoading()
        interactor?.getTracksData()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    // TODO: implement interactor output methods
    func formatedData(data: [TrackViewModel]) {
        view?.presentData(data: data)
        view?.stopLoading()
    }
}
