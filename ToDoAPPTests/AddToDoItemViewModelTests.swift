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
        var targetItem: TodoItem?
        let sut = AddToDoItemViewModel(onSaveClicked: {(item) -> Void in
            targetItem = item
        })
        let title = "task 1"
        sut.text = title
        
        // When
        sut.save()
        
        // Then
        XCTAssertEqual(targetItem?.title, title)
    }
    
    func testSaveButtonStateShouldBeEnabledWhenInputIsNotNil() {
        // Given
        let sut = AddToDoItemViewModel(onSaveClicked: {(_) -> Void in })
        sut.updateButtonState(input: "not nil")
        
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
