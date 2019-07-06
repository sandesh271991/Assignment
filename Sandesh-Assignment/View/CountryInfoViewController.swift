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


class CountryInfoViewController:UIViewController {
    
    var tableView: UITableView?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
         view.backgroundColor = .blue
        
        //TableView UI
        tableView = UITableView.init(frame: view.bounds)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.clipsToBounds = true
        tableView?.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 44.0
        view.addSubview(tableView!)
        tableView?.register(CountryInfoCell.self, forCellReuseIdentifier: "CountryInfoCellID")
        
        setupLayout()
    }
    
    func setupLayout() {
        tableView?.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view); // to make table size same as view
        }
    }
    
}
