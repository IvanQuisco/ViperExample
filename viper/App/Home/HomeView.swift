//
//  HomeView.swift
//  viper
//
//  Created by Ivan Quintana on 08/08/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UITableViewController {
    
    //MARK: - UI
    
    let activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.style = .large
        view.color = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: Properties
    var presenter: HomePresenterProtocol?
    let cellID = "cellID"
    
    var dataSource: [TrackViewModel] = []

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    func setupUI() {
        navigationItem.title = "Results"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        view.addSubview(activityView)
        activityView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension HomeView: HomeViewProtocol {
    
    
    func presentData(data: [TrackViewModel]) {
        self.dataSource = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func startLoading() {
        DispatchQueue.main.async {
            self.activityView.startAnimating()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.activityView.stopAnimating()
        }
    }
    
    // TODO: implement view output methods
}

//MARK: - UITableViewDataSource
extension HomeView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        cell.textLabel?.text = dataSource[indexPath.row].name
        cell.detailTextLabel?.text = dataSource[indexPath.row].artist
        cell.imageView?.image = dataSource[indexPath.row].image.withRenderingMode(.alwaysOriginal)
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
}


//MARK: - UITableViewDelegate
extension HomeView {
    
}
