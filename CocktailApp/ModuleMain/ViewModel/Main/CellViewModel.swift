//
//  CellViewModel.swift
//  CocktailApp
//
//  Created by mac on 07/11/2021.
//

import Foundation

struct CellViewModel {
   var itemDetails:CurrentCoctailDetail
    
    init(item: CurrentCoctailDetail) {
        self.itemDetails = item
    }
}
