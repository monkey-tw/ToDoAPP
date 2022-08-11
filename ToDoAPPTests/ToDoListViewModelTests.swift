//
//  ToDoAPPTests.swift
//  ToDoAPPTests
//
//  Created by Jiaxin Pu on 2022/8/9.
//

import XCTest
@testable import ToDoAPP

class ToDoListViewModelTests: XCTestCase {
    
    private var sut: TodoListViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TodoListViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testShouldAddNewTodoItemBeSuccessfulWhenReceiveAddItemCallback() {
        // Given
        let newItem = TodoItem(title: "write code")
        // When
        sut.save(item: newItem)
        // Then
        XCTAssertEqual(sut.todoItems.count, 1)
    }
    
    func testShouldAddNewTodoItemAsTheFirstWhenReceiveAddItemCallback() {
        // Given
        let newItemOne = TodoItem(title: "task 1")
        let newItemTwo = TodoItem(title: "task 2")
        sut.save(item: newItemOne)
        // When
        
        sut.save(item: newItemTwo)
        // Then
        XCTAssertEqual(sut.todoItems[0], newItemTwo)
    }
    
    func testShouldMoveTodoItemsToFinishedItemsWhenCheck() {
        // Given
        let newItem = TodoItem(title: "task 1")
        sut.save(item: newItem)
        // When
        sut.check(item: newItem)
        // Then
        XCTAssertEqual(sut.todoItems.count, 0)
        XCTAssertEqual(sut.finishedItems[0], newItem)
    }
    
    func testShouldMoveTodoItemsToFinishedAsTheFirstItemsWhenCheck() {
        // Given
        let newItemOne = TodoItem(title: "task 1")
        let newItemTwo = TodoItem(title: "task 2")
        sut.save(item: newItemOne)
        sut.save(item: newItemTwo)
        sut.check(item: newItemOne)
        // When
        sut.check(item: newItemTwo)
        // Then
        XCTAssertEqual(sut.finishedItems[0], newItemTwo)
    }
    
    func testShouldMoveFinishedItemsToTodoItemsWhenUncheck() {
        // Given
        let newItem = TodoItem(title: "task 1")
        sut.save(item: newItem)
        sut.check(item: newItem)
        // When
        sut.uncheck(item: newItem)
        // Then
        XCTAssertEqual(sut.finishedItems.count, 0)
        XCTAssertEqual(sut.todoItems[0], newItem)
    }
    
    func testShouldMoveFinishedItemsToTodoItemsAsTheLastWhenUncheck() {
        // Given
        let newItemOne = TodoItem(title: "task 1")
        let newItemTwo = TodoItem(title: "task 2")
        sut.save(item: newItemOne)
        sut.save(item: newItemTwo)
        sut.check(item: newItemOne)
        sut.check(item: newItemTwo)
        sut.uncheck(item: newItemOne)
        // When
        sut.uncheck(item: newItemTwo)
        // Then
        XCTAssertEqual(sut.todoItems.last, newItemTwo)
    }
    
    func testShouldDeleteItemFromTodoItemsWhenDelete() {
        // Given
        let newItem = TodoItem(title: "task 1")
        sut.save(item: newItem)
        // When
        sut.delete(item: newItem)
        // Then
        XCTAssertFalse(sut.todoItems.contains(newItem))
    }
    
    func testShouldDeleteItemFromFinishedItemsWhenDelete() {
        // Given
        let newItem = TodoItem(title: "task 1")
        sut.save(item: newItem)
        sut.check(item: newItem)
        // When
        sut.delete(item: newItem)
        // Then
        XCTAssertFalse(sut.finishedItems.contains(newItem))
    }

    func testSaveButtonStateShouldBeEnabledWhenInputIsNotNil() {
        // Given
        sut.updateButtonState(input: "not null")
        
        // Then
        XCTAssertEqual(sut.buttonState, .enabled)
    }
    
    func testSaveButtonStateShouldBeDisabledWhenInputIsNil() {
        // Given
        sut.updateButtonState(input: "not nil")
        
        // When
        sut.updateButtonState(input: nil)
        
        // Then
        XCTAssertEqual(sut.buttonState, .disabled)
    }
}
