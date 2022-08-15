//
//  AddTodoItemViewTests.swift
//  ToDoAPPUITests
//
//  Created by Zishu Ma on 2022/8/11.
//

import XCTest

class AddTodoItemViewTests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("-cleanUserDefaults")
        app.launchEnvironment["rootView"] = "AddTodoItemView"
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testShouldShowAllElements() {
        XCTAssertTrue(app.staticTexts["Title"].exists)
        XCTAssertTrue(app.textFields["Input"].exists)
        XCTAssertTrue(app.buttons["Cancel"].exists)
        XCTAssertTrue(app.buttons["Save"].exists)
    }
    
    func testShouldSaveButtonEnabledWhenInputTitle() {
        //When
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("123")
        
        //Then
        XCTAssertTrue(app.buttons["Save"].isEnabled)
    }
    
    func testShouldSaveButtonDiabledWhenInputIsEmpty() {
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("task1")
        
        //When
        app.textFields["Input"].clearAndEnterText(text: "")
        
        //Then
        XCTAssertFalse(app.buttons["Save"].isEnabled)
    }
    
}


