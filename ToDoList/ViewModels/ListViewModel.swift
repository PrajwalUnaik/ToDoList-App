//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Prajwal U on 15/01/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    // MARK: - Initialization
    
    init() {
        getItem()
    }
    
    // MARK: - Data Retrieval
    
    /// Fetch initial data for the list.
    func getItem() {
        let newItems = [
            ItemModel(title: "First one", isCompleted: true),
            ItemModel(title: "Second toDo", isCompleted: true),
            ItemModel(title: "Third toDo", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    // MARK: - List Actions
    
    /// Delete an item at the specified index set.
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    /// Move an item from one index set to another index.
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    /// Add a new item to the list with the given title.
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}
