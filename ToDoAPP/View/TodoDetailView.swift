//
//  TodoDetailView.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/12.
//

import SwiftUI

struct TodoDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: TodoDetailViewModel
    
    var body: some View {
        VStack{
            Text("Todo Detail")
            
            Text(viewModel.title)
            
            
            Button(action: {
                if viewModel.isChecked {
                    viewModel.uncheck(item: viewModel.item)
                } else {
                    viewModel.check(item: viewModel.item)
                }
            }, label: {
                Text(viewModel.isChecked ? "Uncheck" : "Check")
            })
            
            Button(action: {
                self.dismiss()
            }, label: {
                Text("Dismiss")
            })
        }.accessibility(identifier: "Todo Detail Body")
    }
}

