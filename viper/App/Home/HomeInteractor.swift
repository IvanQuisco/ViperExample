//
//  HomeInteractor.swift
//  viper
//
//  Created by Ivan Quintana on 08/08/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    func getTracksData() {
        remoteDatamanager?.fetchDataFromServer()
    }
    

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    
    // TODO: Implement use case methods
    func receivedData(data: ItunesResponse) {
        
        var viewModels: [TrackViewModel] = []
        
        for track in data.results {
            let name = track.trackName
            let artist = track.artistName
            
            let url = track.artworkUrl100
            remoteDatamanager?.fetchImageFromServer(from: url, completion: { (imageData) in
                let viewModel = TrackViewModel(name: name, artist: artist, imageData: imageData)
                viewModels.append(viewModel)
                
                
                if viewModels.count == data.results.count {
                    self.presenter?.formatedData(data: viewModels)
                }
            })
        }
    }
}
