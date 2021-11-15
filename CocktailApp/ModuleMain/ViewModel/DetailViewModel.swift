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
    let urlImg:String?
    let instructionString:String?

    init(item: CurrentCoctailDetail) {
        itemDetails = item
        self.drinkName = "Название напитка: \n" + item.strDrink
        self.urlImg = item.strDrinkThumb
        self.instructionString = "Инструкция: \n" + item.strInstructions!
    }
}
