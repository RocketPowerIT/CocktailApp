//
//  CocktailViewModel.swift
//  CocktailApp
//
//  Created by mac on 07/11/2021.
//

import Foundation
protocol CocktailViewModelProtocol {
    func configureViewModel(withModel model:AllCoctail)
    var reloadTableView:(()->Void)? { get set }
}

class MainViewModel:CocktailViewModelProtocol {
    
    var network = APICoctailManager()
    
    var reloadTableView:(()->Void)?

    var cellViewModels = [CellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    func createCellViewModel(model: CurrentCoctailDetail)->CellViewModel{
        return CellViewModel(item: model)
    }
    
    func configureViewModel(withModel model:AllCoctail){
        for item in model.drinks {
            cellViewModels.append(createCellViewModel(model: item))
        }
    }
    
    func getCurrentCell(indexPath: IndexPath)->CellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func fetchData(){
        let urlStr="https://www.thecocktaildb.com/api/json/v1/1/random.php"
        network.fetch(url: urlStr) { result in
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

