//
//  AddTodoItemView.swift
//  ToDoAPP
//
//  Created by Jiaxin Pu on 2022/8/11.
//

import SwiftUI

struct AddTodoItemView: View {
    @StateObject var viewModel: AddToDoItemViewModel = .init { _ in }
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                
                TextField("Input", text: $viewModel.text)
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text("Cancel")
                }
                
                Button {
                    
                } label: {
                    Text("Save")
                }.disabled(viewModel.buttonState == .enabled)

            }
            
        }
    }
}

struct AddTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoItemView()
    }
}
