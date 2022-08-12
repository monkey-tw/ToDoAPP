//
//  ToDoAPPUITests.swift
//  ToDoAPPUITests
//
//  Created by Jiaxin Pu on 2022/8/9.
//

import XCTest

class TodoListViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldShowAllElements() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.navigationBars.element.descendants(matching: .button)["Add"].exists)
        XCTAssertTrue(app.navigationBars.element.descendants(matching: .staticText)["ToDo"].exists)
    }
    
    func testShouldShowAddTodoItemViewWhenTapAddButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Add"].tap()
        
        XCTAssertTrue(app.textFields["Input"].exists)
    }

    func testShouldOnlyShowTodoSectionHeaderTitleWhenOnlyHasTotoItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("task1")
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.staticTexts["ToDo Items"].exists)
        XCTAssertFalse(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldOnlyShowFinishedSectionHeaderTitleWhenOnlyHasFinishedItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("task1")
        app.buttons["Save"].tap()
        
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        
        XCTAssertFalse(app.staticTexts["ToDo Items"].exists)
        XCTAssertTrue(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldShowBothTodoAndFinishedSectionWhenHasBothTodoAndFinishedItems() throws {
        let app = XCUIApplication()
        app.launch()
        
        //Add Task1
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("task1")
        app.buttons["Save"].tap()
        
        //Add Task2
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("task2")
        app.buttons["Save"].tap()
        
        //check 1
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        
        XCTAssertTrue(app.staticTexts["ToDo Items"].exists)
        XCTAssertTrue(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldShowTodoSectionAboveFinishedSectionWhenHasBothTodoAndFinishedItems() throws {
        let app = XCUIApplication()
        app.launch()
        
        //Add Task1
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("task1")
        app.buttons["Save"].tap()
        
        //Add Task2
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("task2")
        app.buttons["Save"].tap()
        
        //check 1
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        
        XCTAssertTrue(app.staticTexts["ToDo Items"].frame.origin.y < app.staticTexts["Finished Items"].frame.origin.y)
    }
    
    func testShouldShowEmptyViewWhenNoItems() {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertFalse(app.staticTexts["ToDo Items"].exists)
        XCTAssertFalse(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldOnlyShowFinishedCellWhenHasFinishedItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText("task1")
        app.buttons["Save"].tap()
        
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        XCTAssertTrue(app.staticTexts["FinishedCellTitle"].exists)
    }
    
}
