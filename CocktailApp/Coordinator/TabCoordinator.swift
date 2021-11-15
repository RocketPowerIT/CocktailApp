//
//  TabCoordinator.swift
//  CocktailApp
//
//  Created by mac on 15/11/2021.
//

import Foundation
import UIKit

class TabCoordinator: AppCoordinatorProtocol {
    var navigatorController: UINavigationController
    
    var tabBarController = UITabBarController()
    var tabBarControllers = [UIViewController]()
    
    let mainCoordinator:CoctailViewCoordinator?
    let favCoordinator:FavoriteCocktailViewCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigatorController = navigationController
        mainCoordinator = CoctailViewCoordinator(navigationController: navigatorController)
        favCoordinator = FavoriteCocktailViewCoordinator(navigationController: navigatorController)
    }
    
    func Start() {
        self.mainCoordinator?.initVC()
        self.mainCoordinator?.mainViewController.tabBarItem = UITabBarItem(title: "Tab 1", image: nil, selectedImage: nil)

        self.favCoordinator?.initVC()
        self.favCoordinator?.favVC.tabBarItem = UITabBarItem(title: "Favorite", image: nil, selectedImage: nil)
        
        tabBarController.viewControllers = [self.mainCoordinator!.mainViewController,self.favCoordinator!.favVC]
        navigatorController.pushViewController(tabBarController, animated: false)
    }
}
