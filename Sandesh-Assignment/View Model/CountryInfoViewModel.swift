//
//  CountryInfoViewModel.swift
//  Sandesh-Assignment
//
//  Created by sandesh sardar on 05/07/19.
//  Copyright © 2019 sandesh sardar. All rights reserved.
//

import Foundation
import UIKit

class CountryInfoViewModel: NSObject {
    var countryInfoData:CountryInfoDataModel?
    
    var titleText:String {
        return countryInfoData?.title ?? "No Title"
    }
    
    var desctiptionText: String {
        return countryInfoData?.description ?? "No Description"
    }
    
    var imageHrefUrl: URL? {
        if let imgHrefUrl = countryInfoData?.imageHref {
            // To convert string into URL
            if let url = URL.init(string: imgHrefUrl) {
                return url
            }
        }
        return nil
    }
    
    init(countryInfoData: CountryInfoDataModel) {
        self.countryInfoData = countryInfoData
    }
}
