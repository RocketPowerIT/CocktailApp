//
//  DetailViewController.swift
//  CocktailApp
//
//  Created by mac on 07/11/2021.
//

import UIKit

class DetailViewController: UIViewController {
    var viewModel:DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configureVC(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }

}
