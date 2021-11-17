//
//  FavoriteCocktailViewCoordinator.swift
//  CocktailApp
//
//  Created by mac on 15/11/2021.
//

import Foundation
import UIKit

final class FavoriteCocktailViewCoordinator: AppCoordinatorProtocol {
    
    var navigatorController: UINavigationController
    var parentCoordinator:TabCoordinator?
    var favVC: FavoriteCocktailViewController!
    
    init(navigationController: UINavigationController) {
        self.navigatorController = navigationController
    }
    
    func Start() {
        self.navigatorController.pushViewController(self.favVC, animated: false)
    }
    
    func initVC(){
        self.favVC = FavoriteCocktailViewController()
        self.favVC.coordinator = self
    }
    
    func goToDetail(data: CurrentCoctailDetail){
        let detailVM = DetailViewModel(item: data)
        
        let detailVC = DetailViewController()
        detailVC.configureDetail(viewModel: detailVM)
        
        self.navigatorController.pushViewController(detailVC,animated: false)
    }
    
    
}
