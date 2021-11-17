//
//  FavoriteCocktailViewController.swift
//  CocktailApp
//
//  Created by mac on 15/11/2021.
//

import UIKit
import RealmSwift

class FavoriteCocktailViewController: UIViewController {
    
    var coordinator:FavoriteCocktailViewCoordinator?
    
    var storageManager = DBManager()
    var model:[CurrentCoctailDetail]?
    var notifToken: NotificationToken?
    
    var tableView:UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellVi")
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
    fileprivate func addNotification() {
        notifToken = storageManager.getRealm().observe {  [unowned self] note, realm in
            model = storageManager.getData()
            self.tableView.reloadData()
            print("rel")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite"
        model = storageManager.getData()
        
        setupTableView()
        addNotification()
    }
    
    deinit {
        notifToken?.invalidate()
    }
}

extension FavoriteCocktailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellVi", for: indexPath)  as UITableViewCell?
        cell?.textLabel?.text = model![indexPath.row].strDrink
        return cell!
    }
}

extension FavoriteCocktailViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataItem = model![indexPath.row]
        coordinator?.goToDetail(data: dataItem)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           print("Deleted")
        storageManager.removeObject(obj: model![indexPath.row])
        }
    }
}
