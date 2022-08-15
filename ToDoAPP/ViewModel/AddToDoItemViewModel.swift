//
//  AddToDoItemViewModel.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/10.
//

import Foundation
import Combine

class AddToDoItemViewModel: ObservableObject {
    @Published var text: String = ""
    let onSaveClicked: (TodoItem) -> Void
    @Published var buttonState: ButtonState = .disabled
    private var bags: [AnyCancellable] = .init()
    
    enum ButtonState {
        case disabled
        case enabled
    }
    
    init(onSaveClicked: @escaping ((TodoItem) -> Void)) {
        self.onSaveClicked = onSaveClicked
        setupBandings()
    }
    
    func save() {
        onSaveClicked(TodoItem(title: text))
    }
    
    func save(item: TodoItem) {
        onSaveClicked(item)
    }
    
    func updateButtonState(input: String?) {
        if input?.isEmpty == false {
            buttonState = .enabled
        } else {
            buttonState = .disabled
        }
    }
    
    private func setupBandings() {
        $text.sink {[weak self] newText in
            self?.updateButtonState(input: newText)
        }.store(in: &bags)
    }
}
