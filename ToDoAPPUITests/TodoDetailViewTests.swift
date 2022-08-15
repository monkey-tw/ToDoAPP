//
//  TodoDetailViewTests.swift
//  ToDoAPPUITests
//
//  Created by Zishu Ma on 2022/8/12.
//

import XCTest

class TodoDetailViewTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchEnvironment["rootView"] = "TodoDetailView"
        app.launch()
    }


    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldContainElements() {
        XCTAssertTrue(app.buttons["Check"].exists)
    }
    
    func testShouldShowUncheckWhenClickCheck() {
        app.buttons["Check"].tap()
        XCTAssertTrue(app.buttons["Uncheck"].exists)
    }
    
    func testShouldShowCheckWhenClickUncheck() {
        app.buttons["Check"].tap()
        
        app.buttons["Uncheck"].tap()
        XCTAssertTrue(app.buttons["Check"].exists)
    }
}

