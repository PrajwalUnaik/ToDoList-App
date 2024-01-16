//  ListViewModel.swift
//  ToDoList
//
//  Created by Prajwal U on 15/01/24.


import Foundation

/*
 CRUD Functions
 Create -> addItem
 Read -> getItem
 Update -> updateItem
 Delete -> deleteItem
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItem()
        }
    }
    
    let ItemKey = "items_list"
    
    // MARK: - Initializati
    
    init() {
        getItem()
    }
    
    // MARK: - Data Retrieval
    
    /// Fetch initial data for the list.
    func getItem() {
        
        guard
            let data = UserDefaults.standard.data(forKey: ItemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
        
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
    
    /// update existing item to the list
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where:  {$0.id == item.id} )
        {
            items[index] = item.updateCompletion()
        }}
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(encodedData, forKey: ItemKey)
        }
    }
}
