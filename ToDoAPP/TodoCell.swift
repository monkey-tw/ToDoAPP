//
//  TodoCell.swift
//  ToDoAPP
//
//  Created by Jiaxin Pu on 2022/8/15.
//

import SwiftUI

struct TodoCell: View {
    var title: String
    var isChecked: Bool
    let onCheckStatusButtonClicked: (Bool) -> Void
    let onDeleteClicked: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .accessibility(identifier: isChecked ? "FinishedCellTitle" : "ToDoCellTitle")
            
            Spacer()
            
            HStack {
                Button {
                    onCheckStatusButtonClicked(isChecked)
                } label: {
                    Text(isChecked ? "Uncheck" : "Check")
                }
                
                Spacer().frame(width: 10)
                
                Button {
                    onDeleteClicked()
                } label: {
                    Text("Delete")
                }
            }
        }
    }
}

struct TodoCell_Previews: PreviewProvider {
    static var previews: some View {
        TodoCell(title: "task1", isChecked: false, onCheckStatusButtonClicked: { _ in
        }, onDeleteClicked: {})
    }
}
