//
//  AddToDoItemViewModelTest.swift
//  ToDoAPPTests
//
//  Created by Zishu Ma on 2022/8/10.
//

import XCTest
@testable import ToDoAPP

class AddToDoItemViewModelTests: XCTestCase {

    func testShouldCallOnSaveClickedWhenSaveButtonClicked() {
        // Given
        let newItem = TodoItem(title: "item 1")
        var targetItem: TodoItem?
        let sut = AddToDoItemViewModel(onSaveClicked: {(item) -> Void in
            targetItem = item
        })
        // When
        sut.save(item: newItem)
        // Then
        XCTAssertEqual(newItem, targetItem)
    }
    
    func testSaveButtonStateShouldBeEnabledWhenInputIsNotNil() {
        // Given
        let sut = AddToDoItemViewModel(onSaveClicked: {(_) -> Void in })
        sut.updateButtonState(input: "not null")
        
        // Then
        XCTAssertEqual(sut.buttonState, .enabled)
    }
    
    func testSaveButtonStateShouldBeDisabledWhenInputIsNil() {
        // Given
        let sut = AddToDoItemViewModel(onSaveClicked: {(_) -> Void in })
        sut.updateButtonState(input: "not nil")
        
        // When
        sut.updateButtonState(input: nil)
        
        // Then
        XCTAssertEqual(sut.buttonState, .disabled)
    }
}
