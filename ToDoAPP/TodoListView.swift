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
                            HStack {
                                Text(item.title).accessibility(identifier: "ToDoCellTitle")
                                
                                Spacer()
                                
                                Button {
                                    viewModel.check(item: item)
                                } label: {
                                    Text("Check")
                                }
                            }
                        }
                    }
                }
                if !viewModel.finishedItems.isEmpty {
                    Section("Finished Items") {
                        ForEach(viewModel.finishedItems, id: \.self) { item in
                            HStack {
                                Text(item.title).accessibility(identifier: "FinishedCellTitle")
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("ToDo"))
            .toolbar {
                ToolbarItem<Void, NavigationLink<Text, AddTodoItemView>>(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddTodoItemView(isPushed: $isPushed, viewModel: AddToDoItemViewModel(onSaveClicked: { item in
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
