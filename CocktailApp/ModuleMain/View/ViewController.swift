//
//  ViewController.swift
//  CocktailApp
//
//  Created by mac on 02/11/2021.
//

import UIKit
protocol ViewControllerProtocol {
    func configureVC(viewModel: CocktailViewModel)
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()

    var viewModel:CocktailViewModel?
    
    func configureVC(viewModel: CocktailViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "COCKTAILS"
        reloadTableView()
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.viewModel?.cellViewModels.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as UITableViewCell?
        cell?.textLabel?.text = viewModel?.getCurrentCell(indexPath: indexPath).name
        
        return cell!
    }
    
    fileprivate func reloadTableView() {
        viewModel?.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                print("reload srction")
                self?.tableView.reloadData()
               }
        }
    }
    
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index \(indexPath.row)")
    }
}

