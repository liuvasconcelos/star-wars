//
//  ListScreen.swift
//  star-warsUITests
//
//  Created by Livia Vasconcelos on 01/04/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest

class ListScreen {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var tableView: XCUIElement {
        return app.tables["tableView"]
    }
    
}

