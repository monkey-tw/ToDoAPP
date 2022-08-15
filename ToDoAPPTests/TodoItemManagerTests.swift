//
//  TodoItemManagerTests.swift
//  ToDoAPPTests
//
//  Created by Jiaxin Pu on 2022/8/15.
//

import XCTest
@testable import ToDoAPP

class TodoItemManagerTests: XCTestCase {
    var sut: TodoItemManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = TodoItemManager()
        sut.deleteAllItems()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func testShouldSaveItemWhenSave() throws {
        //Given
        let item = TodoItem(title: "task1")
        
        //When
        sut.save(item)
        
        //Then
        XCTAssertTrue(sut.queryAllItems().contains { $0 == item })
    }
    
    func testShouldSaveDoubleItemsWhenSave() throws {
        //Given
        let item1 = TodoItem(title: "task1")
        sut.save(item1)
        
        //When
        let item2 = TodoItem(title: "task2")
        sut.save(item2)
        
        //Then
        XCTAssertTrue(sut.queryAllItems().contains { $0 == item1 })
        XCTAssertTrue(sut.queryAllItems().contains { $0 == item2 })
    }

    func testShouldDeleteItemWhenOnlyHasOneItem() {
        //Given
        let item = TodoItem(title: "task1")
        sut.save(item)
        
        //When
        sut.delete(item)
        
        //Then
        XCTAssertFalse(sut.queryAllItems().contains { $0 == item })
    }
    
    func testShouldDeleteFirstItemWhenOnlyHasTwoItems() {
        //Given
        let item1 = TodoItem(title: "task1")
        sut.save(item1)
        let item2 = TodoItem(title: "task2")
        sut.save(item2)
        
        //When
        sut.delete(item1)
        
        //Then
        XCTAssertFalse(sut.queryAllItems().contains { $0 == item1 })
        XCTAssertTrue(sut.queryAllItems().contains { $0 == item2 })
    }
    
    func testShouldUpdateItemWhenCheckTodoItem() {
        //Given
        let item = TodoItem(title: "task1")
        sut.save(item)
        item.isChecked = true
        
        //When
        sut.update(item)
        
        //Then
        XCTAssertTrue(sut.queryAllItems().filter { $0 == item }.first?.isChecked == true)
    }
}
