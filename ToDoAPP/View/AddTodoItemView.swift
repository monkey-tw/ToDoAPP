//
//  AddTodoItemView.swift
//  ToDoAPP
//
//  Created by Jiaxin Pu on 2022/8/11.
//

import SwiftUI

struct AddTodoItemView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AddToDoItemViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                
                TextField("Input", text: $viewModel.text)
                    .textFieldStyle(.roundedBorder)
                    
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            Spacer()
                .frame(height: 50)
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
                .frame(width: 100)
                .padding(.all, 6)
                .background(Color.red)
                .cornerRadius(3)
                
                Button {
                    dismiss()
                    viewModel.save()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                }
                .frame(width: 100)
                .padding(.all, 6)
                .background(viewModel.buttonState == .disabled ? Color.gray : Color.green)
                .cornerRadius(3)
                .disabled(viewModel.buttonState == .disabled)
            }
        }
    }
}

struct AddTodoItemView_Previews: PreviewProvider {
    @State static var isPushed: Bool = false
    static var previews: some View {
        AddTodoItemView(viewModel: .init(onSaveClicked: { _ in }))
    }
}
