//
//  ToDoListViewModelIntegrationTests.swift
//  ToDoAPPTests
//
//  Created by Jiaxin Pu on 2022/8/18.
//

import XCTest
@testable import ToDoAPP

class ToDoListViewModelIntegrationTests: XCTestCase {
    
    private var sut: TodoListViewModel!
    private var manager: TodoItemManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        manager = TodoItemManager()
        manager.deleteAllItems()
        sut = TodoListViewModel(todoItemStorable: manager)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        manager = nil
        sut = nil
    }
    

    func testShouldAddNewTodoItemBeSuccessfulWhenReceiveAddItemCallback() {
        // Given
        let newItem = TodoItem(title: "write code")
        // When
        sut.save(item: newItem)
        // Then
        XCTAssertTrue(manager.queryAllItems().contains(newItem))
    }
    
    func testShouldMoveTodoItemsToFinishedItemsWhenCheck() {
        // Given
        let newItem = TodoItem(title: "task 1")
        sut.save(item: newItem)
        // When
        sut.check(item: newItem)
        // Then
        XCTAssertEqual(manager.queryAllItems().filter{ $0 == newItem }.first?.isChecked, true)
    }
    
    func testShouldUncheckFinishedItemsToTodoItemsWhenUncheck() {
        // Given
        let newItem = TodoItem(title: "task 1")
        sut.save(item: newItem)
        sut.check(item: newItem)
        // When
        sut.uncheck(item: newItem)
        // Then
        XCTAssertEqual(manager.queryAllItems().filter{ $0 == newItem }.first?.isChecked, false)
    }
    
    func testShouldDeleteItemFromTodoItemsWhenDelete() {
        // Given
        let newItem = TodoItem(title: "task 1")
        sut.save(item: newItem)
        XCTAssertTrue(manager.queryAllItems().contains(newItem))
        
        // When
        sut.delete(item: newItem)
        // Then
        XCTAssertFalse(manager.queryAllItems().contains(newItem))
    }
}
