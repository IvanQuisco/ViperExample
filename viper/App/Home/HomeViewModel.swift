//
//  HomeViewModel.swift
//  viper
//
//  Created by Ivan Quintana on 08/08/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit

struct TrackViewModel {
    let name: String
    let artist: String
    let image: UIImage

    init(name: String, artist: String, imageData: Data?) {
        self.name = name
        self.artist = artist
        
        if let data = imageData {
            self.image = UIImage(data: data) ?? UIImage(named: "trackPlaceholder")!
        } else {
            self.image = UIImage(named: "trackPlaceholder")!
        }
        
    }
}
