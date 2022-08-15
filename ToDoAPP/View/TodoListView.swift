//
//  ContentView.swift
//  ToDoAPP
//
//  Created by Jiaxin Pu on 2022/8/9.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModel = .init()
    @State var isPushed: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                if !viewModel.todoItems.isEmpty {
                    Section("ToDo Items") {
                        ForEach(viewModel.todoItems, id: \.self) { item in
                            NavigationLink(destination: TodoDetailView(viewModel: TodoDetailViewModel(item: item, onCheckClicked: {(item) in
                                viewModel.check(item: item)
                            }, onUnCheckClicked: {(item) in
                                viewModel.uncheck(item: item)
                            }))) {
                                TodoCell(title: item.title, isChecked: item.isChecked, onCheckStatusButtonClicked: { isChecked in
                                    if isChecked {
                                        viewModel.uncheck(item: item)
                                    }else {
                                        viewModel.check(item: item)
                                    }
                                }, onDeleteClicked: {
                                    viewModel.delete(item: item)
                                }).buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                }
                if !viewModel.finishedItems.isEmpty {
                    Section("Finished Items") {
                        ForEach(viewModel.finishedItems, id: \.self) { item in
                            NavigationLink(destination: TodoDetailView(viewModel: TodoDetailViewModel(item: item, onCheckClicked: {(item) in
                                viewModel.check(item: item)
                            }, onUnCheckClicked: {(item) in
                                viewModel.uncheck(item: item)
                            }))) {
                                TodoCell(title: item.title, isChecked: item.isChecked, onCheckStatusButtonClicked: { isChecked in
                                    if isChecked {
                                        viewModel.uncheck(item: item)
                                    }else {
                                        viewModel.check(item: item)
                                    }
                                }, onDeleteClicked: {
                                    viewModel.delete(item: item)
                                }).buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                }
            }
            .buttonStyle(BorderlessButtonStyle())
            .navigationTitle(Text("ToDo"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddTodoItemView(viewModel: AddToDoItemViewModel(onSaveClicked: { item in
                        self.viewModel.save(item: item)
                    })), isActive: $isPushed) {
                        Text("Add")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
