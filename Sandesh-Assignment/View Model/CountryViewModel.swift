//
//  CountryViewModel.swift
//  Sandesh-Assignment
//
//  Created by sandesh sardar on 05/07/19.
//  Copyright © 2019 sandesh sardar. All rights reserved.
//

import Foundation
import UIKit

class CountryViewModel: NSObject {
    var countryData:CountryDataModel?
    
    var title:String {
        return countryData?.title ?? "No Title"
    }
    
    var info: [CountryInfoDataModel] {
        
        return countryData?.info ?? []
    }
    
    init(countrydata: CountryDataModel) {
        self.countryData = countrydata
    }
}
