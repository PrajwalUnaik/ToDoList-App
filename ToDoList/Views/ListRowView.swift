//
//  ListRowView.swift
//  ToDoList
//
//  Created by Prajwal U on 15/01/24.
//

import SwiftUI

struct ListRowView: View {
    
    // MARK: - Properties
    
    let item: ItemModel
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            // Checkmark or circle icon based on completion status
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            // Display the title of the item
            Text(item.title)
            
            // Spacer to push content to the right
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

// MARK: - Preview

// Sample data for preview
var item1 = ItemModel(title: "First one", isCompleted: false)
var item2 = ItemModel(title: "Second toDo", isCompleted: true)

#Preview {
    // Display ListRowView for sample items in a Group
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    .previewLayout(.sizeThatFits)
}
