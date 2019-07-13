//
//  Sandesh_AssignmentTests.swift
//  Sandesh-AssignmentTests
//
//  Created by sandesh sardar on 05/07/19.
//  Copyright © 2019 sandesh sardar. All rights reserved.
//

import XCTest
@testable import Sandesh_Assignment
class Sandesh_AssignmentTests: XCTestCase {
    
    var countryDataModel: CountryDataModel!
    var countryViewModel: CountryViewModel!
    
    var contryInfoViewModel: CountryInfoViewModel!
    var contryInfoDataModel: CountryInfoDataModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    super.setUp()
        
       countryDataModel = CountryDataModel.init(title: "Country Name", info: [CountryInfoDataModel.init(title: "Place Name", description: "Place description", imageHref: nil)])
        
        countryViewModel = CountryViewModel.init(countrydata: countryDataModel)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
   func testInitializationWithModel() {
    
        XCTAssertNotNil(countryViewModel, "Contry VIew model should not be nil")
    
        XCTAssertTrue(countryViewModel.countryData?.title == countryDataModel.title, "Country View model title should be equal to country data model title" )
    
        XCTAssertTrue(countryViewModel.countryData?.info?.count == countryDataModel.info?.count, "Country Info array count should be equal to country data array count" )

    }

}
