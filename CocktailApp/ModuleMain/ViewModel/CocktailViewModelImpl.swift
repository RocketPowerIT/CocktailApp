//
//  CocktailViewModel.swift
//  CocktailApp
//
//  Created by mac on 07/11/2021.
//

import Foundation
protocol CocktailViewModelProtocol {
   // var netw:APICoctailManager? { get set }
    func configureViewModel(withModel model:CurrentCoctail)
    var reloadTableView:(()->Void)? { get set }
}

class CocktailViewModel:CocktailViewModelProtocol {
    
    var netw = APICoctailManager()
    
    var reloadTableView:(()->Void)?
    
    var cellViewModels = [CellViewModel]() {
            didSet {
                reloadTableView?()
            }
    }
    
    func createCellModel(model: DrinkCoctail?)->CellViewModel{
        let id = model!.idDrink
        let name = model!.strDrink
        return CellViewModel(id: id, name: name)
    }
    
    func configureViewModel(withModel model:CurrentCoctail){
        for item in model.drinks {
            cellViewModels.append(createCellModel(model: item))
        }
    }
    
    func getCurrentCell(indexPath: IndexPath)->CellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func fetchData(){
        let urlStr="https://www.thecocktaildb.com/api/json/v1/1/random.php"
        netw.fetch(url: urlStr) { result in
            switch result{
            case .success(let data):
                print(data)
                self.configureViewModel(withModel: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

