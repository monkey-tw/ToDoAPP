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
//        app.launchEnvironment["rootView"] = "TodoDetailView"
        app.launch()
    }


    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldContainElements() {
        directToTodoItemDetail(title: "task1")
        
        XCTAssertTrue(app.staticTexts["task1"].exists)
        XCTAssertTrue(app.buttons["Check"].exists)
    }
    
    func testShouldBackToTodoListWhenClickDismiss() {
        directToTodoItemDetail(title: "task1")
        
        app.buttons["ToDo"].tap()
        XCTAssertTrue(app.navigationBars["ToDo"].exists)
        XCTAssertTrue(app.navigationBars.buttons["Add"].exists)
    }
    
    func testShouldShowUncheckWhenClickCheck() {
        directToTodoItemDetail(title: "task1")
        
        app.buttons["Check"].tap()
        XCTAssertTrue(app.buttons["Uncheck"].exists)
    }
    
    func testShouldMoveToFinishedSectionWhenClickCheckInDetailView() {
        //Given
        directToTodoItemDetail(title: "task1")
        
        //When
        app.buttons["Check"].tap()
        
        //Then
        XCTAssertFalse(app.staticTexts["ToDo Items"].exists)
        XCTAssertTrue(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldShowCheckWhenClickUncheck() {
        directToFinishedItemDetail(title: "task 1")
        
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
    
    func directToTodoItemDetail(title: String) {
        addTodoItem(title: title)
        
        XCTAssertTrue(app.staticTexts[title].exists)
        app.staticTexts[title].tap()
    }
    
    func directToFinishedItemDetail(title: String) {
        addFinishItem(title: title)
        
        XCTAssertTrue(app.staticTexts[title].exists)
        app.staticTexts[title].tap()
    }
}
