//
//  ListUITest.swift
//  star-warsUITests
//
//  Created by Livia Vasconcelos on 01/04/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest
@testable import star_wars

class ListUITest: XCTestCase {
    let app = XCUIApplication()
    
    var bundle: Bundle?
    
    var listScreen: ListScreen?
    
    override func setUp() {
        super.setUp()
        bundle      = Bundle(for: ListUITest.self)
        
        listScreen  = ListScreen(app: app)
        app.launchEnvironment = ["TESTING": "YES"]
        app.launch()
    }
    
    func testOpeningScreenWithCorrectInformation() {
        XCTAssertEqual(listScreen?.tableView.cells.count, 3)
    }
}
