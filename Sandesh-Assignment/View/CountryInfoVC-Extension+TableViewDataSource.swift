//
//  CountryInfoVC-Extension+TableViewDataSource.swift
//  Sandesh-Assignment
//
//  Created by sandesh sardar on 06/07/19.
//  Copyright © 2019 sandesh sardar. All rights reserved.
//

import UIKit

extension CountryInfoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countryViewModel?.info.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var countryInfoCell: CountryInfoCell? = tableView.dequeueReusableCell(withIdentifier: countryInfoCellId, for: indexPath) as? CountryInfoCell
        
        if countryInfoCell == nil {
            countryInfoCell = CountryInfoCell.init(style: .default, reuseIdentifier: countryInfoCellId)
        }
        
        countryInfoCell?.countryInfoViewModel = CountryInfoViewModel.init(countryInfoData: (countryViewModel?.info[indexPath.section])!)
        
        countryInfoCell?.layoutIfNeeded()
        countryInfoCell?.layoutSubviews()
        return countryInfoCell!
    }
}
