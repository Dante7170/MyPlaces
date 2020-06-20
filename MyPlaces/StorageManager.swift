//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Jasurbek Komilov on 19.06.2020.
//  Copyright © 2020 Jasurbek Komilov. All rights reserved.
//

import RealmSwift

let realm = try! Realm() // точка входа в базу данных (сама БД)

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write { //   добавляем объект в БД
            realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place) // удаляем объект из БД
        }
    }
}
