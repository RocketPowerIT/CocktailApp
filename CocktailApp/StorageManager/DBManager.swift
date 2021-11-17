//
//  DBManager.swift
//  CocktailApp
//
//  Created by mac on 17/11/2021.
//

import Foundation
import RealmSwift

class DBManager {
    
    func getRealm()->Realm{
        let mainRealm = try! Realm(configuration: .defaultConfiguration)
        return mainRealm
    }
    
    func save(model: CurrentCoctailDetail) {
        try! getRealm().write {
            getRealm().add(model)
        }
    }
    
    func getData()->[CurrentCoctailDetail] {
        let model = getRealm().objects(CurrentCoctailDetail.self)
        return Array(model)
    }
    
    func removeObject(obj: Object) {
        try! getRealm().write {
            getRealm().delete(obj)
        }
    }
}
