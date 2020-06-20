//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Jasurbek Komilov on 16.06.2020.
//  Copyright © 2020 Jasurbek Komilov. All rights reserved.
//

import RealmSwift

class Place: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    
    convenience init(name: String, location: String?, type: String?, imageData: Data?){
        self.init()
        self.name = name
        self.location = location
        self.type = type
        self.imageData = imageData
        // присваивает новые значения к сданному пожтому self.init()
    }
    
}
