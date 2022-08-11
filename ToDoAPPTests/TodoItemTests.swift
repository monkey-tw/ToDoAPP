//
//  TodoItemTests.swift
//  ToDoAPPTests
//
//  Created by Zishu Ma on 2022/8/11.
//

import XCTest
@testable import ToDoAPP

class TodoItemTests: XCTestCase {

    func testShouldInitSuccessfullyWhenInit() {
        // Given
        let newItem = TodoItem(title: "new name")
        
        // Then
        XCTAssertNotNil(newItem)
        XCTAssertEqual(newItem.title, "new name")
        XCTAssertFalse(newItem.isChecked)
    }
    
    func testTwoTodoItemsShouldBeEqualWhenHaveTheSameTitle() {
        // Given
        let newItemOne = TodoItem(title: "same name")
        let newItemTwo = TodoItem(title: "same name")
        
        // Then
        XCTAssertEqual(newItemOne, newItemTwo)
    }
    
    func testTwoTodoItemsShouldNotBeEqualWhenHaveDifferentTitles() {
        // Given
        let newItemOne = TodoItem(title: "same name")
        let newItemTwo = TodoItem(title: "different name")
        
        // Then
        XCTAssertNotEqual(newItemOne, newItemTwo)
    }
    
}
