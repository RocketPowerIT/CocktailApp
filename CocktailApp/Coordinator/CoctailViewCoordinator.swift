//
//  CoctailViewCoordinator.swift
//  CocktailApp
//
//  Created by mac on 06/11/2021.
//

import Foundation
import UIKit

final class CoctailViewCoordinator: AppCoordinatorProtocol {
    
    var navigatorController: UINavigationController
    
    private var mainViewController: MainViewController!
    
    private var mainViewModel: MainViewModel!
    
    init(navigationController: UINavigationController) {
        self.navigatorController = navigationController
    }
    
    func Start() {
        mainViewModel = MainViewModel()
        self.mainViewController = MainViewController(viewModel: mainViewModel)
        self.navigatorController.pushViewController(self.mainViewController, animated: false)
        mainViewController.coordinator = self
    }
    
    func goToDetail(data: CurrentCoctailDetail){
        let detailVM = DetailViewModel(item: data)
        
        let detailVC = DetailViewController()
        detailVC.configureDetail(viewModel: detailVM)
        
        self.navigatorController.pushViewController(detailVC,animated: false)
    }
}
