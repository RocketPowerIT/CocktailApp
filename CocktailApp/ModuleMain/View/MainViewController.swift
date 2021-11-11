//
//  ViewController.swift
//  CocktailApp
//
//  Created by mac on 02/11/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var coordinator: CoctailViewCoordinator?
    
    init(viewModel: MainViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()

    var viewModel:MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "COCKTAILS"
        viewModel?.fetchData()
        viewModel?.fetchData()
        viewModel?.fetchData()
        viewModel?.fetchData()
        viewModel?.fetchData()
        viewModel?.fetchData()
        viewModel?.fetchData()
        reloadTableView()
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.viewModel?.cellViewModels.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as UITableViewCell?
        cell?.textLabel?.text = viewModel?.getCurrentCell(indexPath: indexPath).itemDetails.strDrink
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

extension MainViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataItem = viewModel?.getCurrentCell(indexPath: indexPath).itemDetails
        coordinator?.goToDetail(data: dataItem!)
    }
}


