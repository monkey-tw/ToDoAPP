//
//  TodoDetailViewModelTests.swift
//  ToDoAPPTests
//
//  Created by Zishu Ma on 2022/8/10.
//

import XCTest
@testable import ToDoAPP

class TodoDetailViewModelTests: XCTestCase {

    func testShouldCallOnCheckClickedWhenCheck() {
        // Given
        let newItem = TodoItem(title: "item 1")
        var targetItem: TodoItem?
        let sut = TodoDetailViewModel(
            item: newItem,
            onCheckClicked: {(item) -> Void in
            targetItem = item
        }, onUnCheckClicked: { (_) in })
        // When
        sut.check(item: newItem)
        // Then
        XCTAssertEqual(newItem, targetItem)
    }
    
    func testShouldCallOnUnCheckClickedWhenUnCheck() {
        // Given
        let newItem = TodoItem(title: "item 1")
        var targetItem: TodoItem?
        let sut = TodoDetailViewModel(item: newItem, onCheckClicked: { (_) in }, onUnCheckClicked: {(item) -> Void in
            targetItem = item
        })
        // When
        sut.uncheck(item: newItem)
        // Then
        XCTAssertEqual(newItem, targetItem)
    }
}
