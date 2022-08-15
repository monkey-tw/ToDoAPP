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
                                
                                Spacer()
                                
                                Button {
                                    viewModel.delete(item: item)
                                } label: {
                                    Text("Delete")
                                }
                                
                                Spacer()
                                NavigationLink(destination: TodoDetailView(viewModel: TodoDetailViewModel(item: item, onCheckClicked: {(_) in}, onUnCheckClicked: {(_) in}))) {
                                    Text("Detail")
                                }
                                .accessibility(identifier: "Detail Button")
                            }
                        }
                    }
                }
                if !viewModel.finishedItems.isEmpty {
                    Section("Finished Items") {
                        ForEach(viewModel.finishedItems, id: \.self) { item in
                            HStack {
                                Text(item.title).accessibility(identifier: "FinishedCellTitle")
                                
                                Spacer()
                                
                                Button {
                                    viewModel.uncheck(item: item)
                                } label: {
                                    Text("Uncheck")
                                }
                                
                                Spacer()
                                
                                Button {
                                    viewModel.delete(item: item)
                                } label: {
                                    Text("Delete")
                                }
                                
                                Spacer()
                                NavigationLink(destination: TodoDetailView(viewModel: TodoDetailViewModel(item: item, onCheckClicked: {(_) in}, onUnCheckClicked: {(_) in}))) {
                                    Text("Detail")
                                }
                                .accessibility(identifier: "Detail Button")
                            }
                        }
                    }
                }
            }
            .buttonStyle(BorderlessButtonStyle())
            .navigationTitle(Text("ToDo"))
            .navigationBarTitleDisplayMode(.inline)
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
