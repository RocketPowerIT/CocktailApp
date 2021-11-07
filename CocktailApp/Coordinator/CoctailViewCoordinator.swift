//
//  CoctailViewCoordinator.swift
//  CocktailApp
//
//  Created by mac on 06/11/2021.
//

import Foundation
import UIKit

final class CoctailViewCoordinator {
    // MARK: - Instance dependencies
    
    private let navigationController: UINavigationController
    
    // MARK: - Instance state
    
    private var viewController: ViewController!
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator functions

    func Start() {
        let viewModel = CocktailViewModel()
        
        //fetch Data
        viewModel.fetchData()
        viewModel.fetchData()
        viewModel.fetchData()
        viewModel.fetchData()
        
        //view
        self.viewController = ViewController()
        self.viewController.configureVC(viewModel: viewModel)
       
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
