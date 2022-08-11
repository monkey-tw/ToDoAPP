//
//  AddTodoItemView.swift
//  ToDoAPP
//
//  Created by Jiaxin Pu on 2022/8/11.
//

import SwiftUI

struct AddTodoItemView: View {
    @Binding var isPushed: Bool
    @StateObject var viewModel: AddToDoItemViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                
                TextField("Input", text: $viewModel.text)
            }
            
            HStack {
                Button {
                    isPushed = false
                } label: {
                    Text("Cancel")
                }
                
                Button {
                    isPushed = false
                    viewModel.save()
                } label: {
                    Text("Save")
                }.disabled(viewModel.buttonState == .disabled)

            }
            
        }
    }
}

struct AddTodoItemView_Previews: PreviewProvider {
    @State static var isPushed: Bool = false
    static var previews: some View {
        AddTodoItemView(isPushed: $isPushed, viewModel: .init(onSaveClicked: { _ in }))
    }
}
