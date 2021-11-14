//
//  DetailViewModel.swift
//  CocktailApp
//
//  Created by mac on 07/11/2021.
//

import Foundation

class DetailViewModel {
    let itemDetails:CurrentCoctailDetail

    let drinkName:String?
    let category:String?
    let alcoholic:String?
    let urlImg:String?
    

    
    init(item: CurrentCoctailDetail) {
       itemDetails = item
        self.drinkName = item.strDrink
        self.category = item.strCategory
        self.alcoholic = item.strAlcoholic
        self.urlImg = item.strDrinkThumb
    }
}
