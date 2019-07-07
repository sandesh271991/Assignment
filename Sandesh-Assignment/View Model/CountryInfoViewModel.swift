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
    
    var desctiptionText: NSAttributedString {
        
        let descriptionString = countryInfoData?.description ?? "No Description"
        let attributes: [NSAttributedString.Key: Any] = [ .font: UIFont.systemFont(ofSize: 18.0), .foregroundColor: UIColor.black]
        
        let descriptionAttributedString =  NSMutableAttributedString.init(string: descriptionString, attributes: attributes)
        
        return descriptionAttributedString
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
