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
        self.view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "CellDetail")
        return table
    }()
    
    func configureDetail(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDetail", for: indexPath)  as UITableViewCell?
        cell?.textLabel?.text = viewModel?.itemDetails.strDrink
        return cell!
    }
    
    
}
