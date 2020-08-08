//
//  HomeRemoteDataManager.swift
//  viper
//
//  Created by Ivan Quintana on 08/08/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    
    
    let endpoint = "https://itunes.apple.com/search?term=hola"
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    
    func fetchDataFromServer() {
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data,response,error) in
            if let error = error {
                print("error: ", error.localizedDescription)
            }
            
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(ItunesResponse.self, from: data)
                    self?.remoteRequestHandler?.receivedData(data: model)
                } catch {
                    print("Serialization error")
                }
                
            }
        }
        task.resume()
    }
    
    func fetchImageFromServer(from url: String, completion: @escaping ((_ data: Data?) -> Void)) {
        
        guard let imageURL = URL(string: url) else  {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print("Fetching error: ", error)
                completion(nil)
                return
            }
            
            if let data = data {
                completion(data)
            }
        }
        task.resume()
    }
    
}
