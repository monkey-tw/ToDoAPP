//
//  TodoDetailView.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/12.
//

import SwiftUI

struct TodoDetailView: View {
    @StateObject var viewModel: TodoDetailViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 50)
            
            Text(viewModel.title)
                .font(.title)
                .fontWeight(.bold)
            
            Spacer().frame(height: 20)
            
            GeometryReader { proxy in
                VStack {
                    Button(action: {
                        if viewModel.isChecked {
                            viewModel.uncheck()
                        } else {
                            viewModel.check()
                        }
                    }, label: {
                        Text(viewModel.isChecked ? "Uncheck" : "Check")
                            .foregroundColor(.white)
                    })
                        .frame(width: proxy.size.width*0.7)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(Color.green)
                        .cornerRadius(5)
                }.frame(width: proxy.size.width)
            }
        }
        .navigationTitle("Todo Detail")
        .accessibility(identifier: "Todo Detail Body")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(viewModel: TodoDetailViewModel(item: .init(title: "task 1"), onCheckClicked: { _ in
            
        }, onUnCheckClicked: { _ in
            
        }))
    }
}
