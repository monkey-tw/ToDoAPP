//
//  ToDoAPPUITests.swift
//  ToDoAPPUITests
//
//  Created by Jiaxin Pu on 2022/8/9.
//

import XCTest

class TodoListViewUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app = XCUIApplication()
        app.launchArguments.append("-cleanUserDefaults")
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldShowAllElements() throws {
        XCTAssertTrue(app.navigationBars.element.descendants(matching: .button)["Add"].exists)
        XCTAssertTrue(app.navigationBars.element.descendants(matching: .staticText)["ToDo"].exists)
    }
    
    func testShouldShowAddTodoItemViewWhenTapAddButton() throws {
        app.buttons["Add"].tap()
        
        XCTAssertTrue(app.textFields["Input"].exists)
    }

    func testShouldOnlyShowTodoSectionHeaderTitleWhenOnlyHasTotoItem() throws {
        addTodoItem(app: app, title: "task1")
        
        XCTAssertTrue(app.staticTexts["ToDo Items"].exists)
        XCTAssertFalse(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldOnlyShowFinishedSectionHeaderTitleWhenOnlyHasFinishedItem() throws {
        addTodoItem(app: app, title: "task1")
        
        XCTAssertTrue(app.tables.element.cells.firstMatch.buttons["Check"].exists)
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        
        XCTAssertFalse(app.staticTexts["ToDo Items"].exists)
        XCTAssertTrue(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldShowBothTodoAndFinishedSectionWhenHasBothTodoAndFinishedItems() throws {
        
        addTodoItem(app: app, title: "task1")
        addTodoItem(app: app, title: "task2")
        
        XCTAssertTrue(app.tables.element.cells.firstMatch.buttons["Check"].exists)
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        
        XCTAssertTrue(app.staticTexts["ToDo Items"].exists)
        XCTAssertTrue(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldInsertToTopOfFinishSectionWhenCheckItemFromToDoSection() {
        // given
        addFinishItem(app: app, title: "task1")
        
        // when
        addFinishItem(app: app, title: "task2")
        
        // then
        XCTAssertFalse(app.staticTexts["ToDo Items"].exists)
        XCTAssertTrue(app.staticTexts["Finished Items"].exists)
        
        XCTAssertTrue(app.staticTexts["task2"].frame.origin.y < app.staticTexts["task1"].frame.origin.y)
    }
    
    func testShouldShowTodoSectionAboveFinishedSectionWhenHasBothTodoAndFinishedItems() throws {
        addTodoItem(app: app, title: "task1")
        addTodoItem(app: app, title: "task2")
        
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        
        XCTAssertTrue(app.staticTexts["ToDo Items"].frame.origin.y < app.staticTexts["Finished Items"].frame.origin.y)
    }
    
    func testShouldShowEmptyViewWhenNoItems() {
        XCTAssertFalse(app.staticTexts["ToDo Items"].exists)
        XCTAssertFalse(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldOnlyShowFinishedCellWhenHasFinishedItem() throws {
        
        addTodoItem(app: app, title: "task1")
        
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        XCTAssertTrue(app.staticTexts["FinishedCellTitle"].exists)
    }
    
    
    func testShouldRemoveItemFromFinishSectionWhenClickUncheckOnItem() {
        // given
        addTodoItem(app: app, title: "task1")
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
        
        // when
        let uncheckButton = app.tables.element.cells.firstMatch.buttons["Uncheck"]
        XCTAssertTrue(uncheckButton.exists)
        uncheckButton.tap()
        
        // then
        XCTAssertTrue(app.staticTexts["ToDo Items"].exists)
        XCTAssertFalse(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldMoveToLastOfToDoSectionWhenUncheckItemFromFinishedSection() {
        // given
        addTodoItem(app: app, title: "task1")
        addFinishItem(app: app, title: "task2")
        
        // when
        let uncheckButton = app.tables.element.cells.buttons["Uncheck"]
        XCTAssertTrue(uncheckButton.exists)
        uncheckButton.tap()
        
        // then
        XCTAssertFalse(app.staticTexts["Finished Items"].exists)
        XCTAssertTrue(app.staticTexts["task1"].frame.origin.y < app.staticTexts["task2"].frame.origin.y)
    }
    
    func testShouldRemoveTodoItemFromTodoSectionWhenDeleteClicked() {
        // Given
        addTodoItem(app: app, title: "task 1")
        
        // When
        let deleteButton = app.tables.element.cells.firstMatch.buttons["Delete"]
        XCTAssertTrue(deleteButton.exists)
        deleteButton.tap()
        
        // Then
        XCTAssertFalse(app.staticTexts["ToDo Items"].exists)
    }
    
    func testShouldRemoveFinishedItemFromFinishedSectionWhenDeleteClicked() {
        // Given
        addFinishItem(app: app, title: "task 1")
        
        // When
        let deleteButton = app.tables.element.cells.firstMatch.buttons["Delete"]
        XCTAssertTrue(deleteButton.exists)
        deleteButton.tap()
        
        // Then
        XCTAssertFalse(app.staticTexts["Finished Items"].exists)
    }
    
    func testShouldContainDetailButtonForTodoItems() {
        // Given
        let title: String = "task 1"
        addTodoItem(app: app, title: title)

        // When
        XCTAssertTrue(app.staticTexts[title].exists)
        app.staticTexts[title].tap()

        // Then
        XCTAssertTrue(app.staticTexts["Todo Detail"].exists)
    }
}

extension TodoListViewUITests {
    
    func addTodoItem(app: XCUIApplication, title: String) {
        app.buttons["Add"].tap()
        app.textFields["Input"].tap()
        app.textFields["Input"].typeText(title)
        app.buttons["Save"].tap()
    }
    
    func addFinishItem(app: XCUIApplication, title: String) {
        addTodoItem(app: app, title: title)
        app.tables.element.cells.firstMatch.buttons["Check"].tap()
    }
}
