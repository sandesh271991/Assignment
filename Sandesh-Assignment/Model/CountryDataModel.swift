//
//  CountryDataModel.swift
//  Sandesh-Assignment
//
//  Created by sandesh sardar on 05/07/19.
//  Copyright © 2019 sandesh sardar. All rights reserved.
//

import Foundation

struct CountryDataModel: Codable {
    var title: String?
    var info: [CountryInfoDataModel]?
}

