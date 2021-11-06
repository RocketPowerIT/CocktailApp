//
//  CurrentCoctail.swift
//  CocktailApp
//
//  Created by mac on 03/11/2021.
//

import Foundation

struct CurrentCoctail:Codable {
    let drinks:[DrinkCoctail]
}

struct DrinkCoctail:Codable {
    let idDrink: String
    let strDrink: String
    let strDrinkAlternate: String?
    let strTags: String?
    let strVideo: String?
    let strCategory: String?
    let strIBA: String?
    let strAlcoholic: String?
    let strGlass: String?
    
    let strInstructions: String?
    let strInstructionsES: String?
    let strInstructionsDE: String?
    let strInstructionsFR: String?
    let strInstructionsIT: String?
    
    let strDrinkThumb: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
   
    let strImageSource: String?
    let strImageAttribution: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
}

/*
 "drinks":[
       {
          "idDrink":"17176",
          "strDrink":"Ipamena",
          "strDrinkAlternate":null,
          "strTags":null,
          "strVideo":null,
          "strCategory":"Ordinary Drink",
          "strIBA":null,
          "strAlcoholic":"Non alcoholic",
          "strGlass":"Wine Glass",
          "strInstructions":"Cut half a lime into pieces, place in a shaker, add the sugar and crush. Measure the passion fruit juice, add it to the shaker and fill up with ice cubes. Close the shaker and shake vigorously. Pour the liquid into a glass, top up with ginger ale, stir with a teaspoon and then garnish the rim of the glass with a slice of lime",
          "strInstructionsES":null,
          "strInstructionsDE":"Eine halbe Limette in St\u00fccke schneiden, in einen Shaker geben, Zucker hinzuf\u00fcgen und zerdr\u00fccken. Passionsfruchtsaft abmessen, in den Shaker geben und mit Eisw\u00fcrfeln auff\u00fcllen. Schlie\u00dfen Sie den Shaker und sch\u00fctteln Sie ihn kr\u00e4ftig. Die Fl\u00fcssigkeit in ein Glas gie\u00dfen, mit Ginger Ale auff\u00fcllen, mit einem Teel\u00f6ffel umr\u00fchren und dann den Rand des Glases mit einer Scheibe Limette garnieren.",
          "strInstructionsFR":null,
          "strInstructionsIT":"Tagliare a pezzi mezzo lime, metterlo in uno shaker, aggiungere lo zucchero e schiacciare.\r\nMisurate il succo di frutto della passione, aggiungetelo allo shaker e riempitelo con cubetti di ghiaccio.\r\nChiudi lo shaker e agita energicamente.\r\nVersare il liquido in un bicchiere, rabboccare con ginger ale, mescolare con un cucchiaino e poi guarnire il bordo del bicchiere con una fetta di lime",
          "strInstructionsZH-HANS":null,
          "strInstructionsZH-HANT":null,
          "strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/yswuwp1469090992.jpg",
          "strIngredient1":"Lime",
          "strIngredient2":"Brown sugar",
          "strIngredient3":"Passion fruit juice",
          "strIngredient4":"Ginger ale",
          "strIngredient5":"Ice",
          "strIngredient6":null,
          "strIngredient7":null,
          "strIngredient8":null,
          "strIngredient9":null,
          "strIngredient10":null,
          "strIngredient11":null,
          "strIngredient12":null,
          "strIngredient13":null,
          "strIngredient14":null,
          "strIngredient15":null,
          "strMeasure1":"\u00bd",
          "strMeasure2":"2 tsp",
          "strMeasure3":"4 cl",
          "strMeasure4":"top up with",
          "strMeasure5":"fill",
          "strMeasure6":null,
          "strMeasure7":null,
          "strMeasure8":null,
          "strMeasure9":null,
          "strMeasure10":null,
          "strMeasure11":null,
          "strMeasure12":null,
          "strMeasure13":null,
          "strMeasure14":null,
          "strMeasure15":null,
          "strImageSource":null,
          "strImageAttribution":null,
          "strCreativeCommonsConfirmed":"No",
          "dateModified":"2016-07-21 09:49:52"
       }
    ]
 */
