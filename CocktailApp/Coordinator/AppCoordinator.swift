//
//  AppCoordinator.swift
//  CocktailApp
//
//  Created by mac on 06/11/2021.
//

import Foundation
import UIKit
protocol AppCoordinatorProtocol {
    var navigatorController: UINavigationController {get set}
    func Start()
}

final class AppCoordinator:AppCoordinatorProtocol {
    var navigatorController:UINavigationController
    var childCoordinator: CoctailViewCoordinator!
    
    func Start() {
        print("start")
        let coctailViewCoordinator = CoctailViewCoordinator(navigationController: self.navigatorController)
        self.childCoordinator = coctailViewCoordinator
        self.childCoordinator.Start()
    }
    
    init(navigationController: UINavigationController) {
        self.navigatorController = navigationController
    }
    
}

