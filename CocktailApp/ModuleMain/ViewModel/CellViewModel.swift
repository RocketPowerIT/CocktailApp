//
//  CellViewModel.swift
//  CocktailApp
//
//  Created by mac on 07/11/2021.
//

import Foundation

class CellViewModel {
    var id:String
    var name:String?
    
    init(id:String,name:String) {
        self.id = id
        self.name = name
    }
}
