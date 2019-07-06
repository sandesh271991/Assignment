//
//  CountryInfoVC-Extension+TableViewDataSource.swift
//  Sandesh-Assignment
//
//  Created by sandesh sardar on 06/07/19.
//  Copyright © 2019 sandesh sardar. All rights reserved.
//

import UIKit

extension CountryInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var countryInfoCell: CountryInfoCell? = tableView.dequeueReusableCell(withIdentifier: "CountryInfoCellID", for: indexPath) as! CountryInfoCell
        
 
        return countryInfoCell!
    }
}
