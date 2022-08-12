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

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app = XCUIApplication()
        app.launchArguments.append("-disableAnimations")
        app.launch()
    }


    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldContainElements() {
        addTodoItem(title: "task1")
        XCTAssertTrue(app.otherElements.buttons["Detail Button"].exists)
        app.otherElements.buttons["Detail Button"].tap()
        XCTAssertTrue(app.staticTexts["task1"].exists)
        XCTAssertTrue(app.buttons["Check"].exists)
        XCTAssertTrue(app.buttons["Dismiss"].exists)
    }
    
    func testShouldBackToTodoListWhenClickDismiss() {
        addTodoItem(title: "task1")
        
        XCTAssertTrue(app.otherElements.buttons["Detail Button"].exists)
        app.otherElements.buttons["Detail Button"].tap()
        
        app.buttons["Dismiss"].tap()
        XCTAssertTrue(app.buttons["Add"].exists)
    }
    
    func testShouldShowUncheckWhenClickCheck() {
        addTodoItem(title: "task1")
        XCTAssertTrue(app.otherElements.buttons["Detail Button"].exists)
        app.otherElements.buttons["Detail Button"].tap()
        app.buttons["Check"].tap()
        XCTAssertTrue(app.buttons["Uncheck"].exists)
    }
    
    func testShouldShowCheckWhenClickUncheck() {
        addFinishItem(title: "task1")
        sleep(1)
        XCTAssertTrue(app.otherElements.buttons["Detail Button"].exists)
        app.otherElements.buttons["Detail Button"].tap()
        app.buttons["Uncheck"].tap()
        XCTAssertTrue(app.buttons["Check"].exists)
    }
}

extension TodoDetailViewTests {
    
    func addTodoItem(title: String) {
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText(title)
        app.buttons["Save"].tap()
    }
    
    func addFinishItem(title: String) {
        addTodoItem(title: title)
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
    }
}