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
        let newItemOne = TodoItem(title: "same name", id: "id1")
        let newItemTwo = TodoItem(title: "same name", id: "id1")
        
        // Then
        XCTAssertEqual(newItemOne, newItemTwo)
    }
    
    func testTwoTodoItemsShouldNotBeEqualWhenHaveDifferentTitle() {
        // Given
        let newItemOne = TodoItem(title: "same name", id: "id1")
        let newItemTwo = TodoItem(title: "different name", id: "id1")
        
        // Then
        XCTAssertNotEqual(newItemOne, newItemTwo)
    }
    
    func testTwoTodoItemsShouldNotBeEqualWhenHaveDifferentId() {
        // Given
        let newItemOne = TodoItem(title: "same name", id: "id1")
        let newItemTwo = TodoItem(title: "same name", id: "id2")
        
        // Then
        XCTAssertNotEqual(newItemOne, newItemTwo)
    }
}
