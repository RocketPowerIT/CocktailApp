//
//  DetailViewController.swift
//  CocktailApp
//
//  Created by mac on 07/11/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel:DetailViewModel?
    
    var network = APICoctailManager()
    
    let detailView: DetailView = {
        let view = DetailView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.myDetailViewController = self
        title = viewModel?.itemDetails.strDrink
    }
    
    func configureDetail(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        detailView.drinkLabel.text = viewModel.drinkName
        network.downloadImage(from: viewModel.urlImg!, completion: { (result) in
            switch result {
            case .success(let img):
                self.detailView.coctailImg.image = img
            case .failure(let error):
                print(error)
                break
            }
        })
        detailView.instructionLabel.text = viewModel.instructionString
    }
}
