//
//  AddTodoItemViewTests.swift
//  ToDoAPPUITests
//
//  Created by Zishu Ma on 2022/8/11.
//

import XCTest

class AddTodoItemViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldShowAllElements() {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["Title"].exists)
        XCTAssertTrue(app.textFields["Input"].exists)
        XCTAssertTrue(app.buttons["Cancel"].exists)
        XCTAssertTrue(app.buttons["Save"].exists)
    }
    
    func testShouldSaveButtonEnabledWhenInputTitle() {
        //Given
        let app = XCUIApplication()
        app.launch()
        
        //When
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("123")
        
        //Then
        XCTAssertTrue(app.buttons["Save"].isEnabled)
    }
    
    func testShouldSaveButtonDiabledWhenInputIsEmpty() {
        //Given
        let app = XCUIApplication()
        app.launch()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("123")
        
        //When
        app.textFields["Input"].typeText("")
        
        //Then
        XCTAssertFalse(app.buttons["Save"].isEnabled)
    }
}
