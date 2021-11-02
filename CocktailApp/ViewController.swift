//
//  ViewController.swift
//  CocktailApp
//
//  Created by mac on 02/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var netw = APICoctailManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .cyan
        fetchData()
    }
    
    fileprivate func fetchData(){
        let urlStr="https://www.thecocktaildb.com/api/json/v1/1/random.php"
        netw.fetch(url: urlStr) { result in
            switch result{
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

