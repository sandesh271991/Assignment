//
//  CountryInfoViewController.swift
//  Sandesh-Assignment
//
//  Created by sandesh sardar on 06/07/19.
//  Copyright © 2019 sandesh sardar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import PINRemoteImage
import Alamofire


class CountryInfoViewController: UIViewController {
    
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?

    var countryViewModel: CountryViewModel?
    var countryData: CountryDataModel? {
        
        didSet {
            guard let countryData = countryData else { return }
                countryViewModel = CountryViewModel.init(countrydata: countryData)
                DispatchQueue.main.async {
                    self.updateView()
                }
            }
    }
        
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //View LifeCycle
    override func viewWillAppear(_ animated: Bool) {
    
        self.fetchData()
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 65.0
    }
    
    func setupViews() {
         view.backgroundColor = .blue
        
        //TableView UI
        tableView = UITableView.init(frame: view.bounds)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.clipsToBounds = true
        tableView?.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 44.0
        
        tableView?.register(CountryInfoCell.self, forCellReuseIdentifier: "CountryInfoCellID")
        tableView?.accessibilityIdentifier = "table--countryInfoTableView"

        //Add refresh control for pull to refresh purpose
        self.refreshControl = UIRefreshControl.init()
        self.refreshControl?.addTarget(self, action: #selector(CountryInfoViewController.fetchData), for: .valueChanged)
        self.tableView?.addSubview(refreshControl!)
        self.tableView?.allowsSelection = false
        
        setupLayout()
    }
    
    func setupLayout() {
        tableView?.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view); // to make table size same as view
        }
    }

    @objc func fetchData() {
        if isConnectedToInternet() == true {
            Webservice.shared.getData(with: webserviceURL) { (countryData, error) in
                self.refreshControl?.endRefreshing()
                if error != nil {
                    return
                }
                guard let countryData = countryData else {return}
                self.countryData = countryData
            }
        }
        else {
            showAlert(title: "No Internet Connection", message: "Please check your internet connection")
        }
    }
    
    
    func updateView() {
        self.title = self.countryViewModel?.title
        self.tableView?.reloadData()
    }
}
