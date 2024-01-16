//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Prajwal U on 15/01/24.
//

import Foundation


class ListViewModel:ObservableObject{
    
    @Published var items: [ItemModel] = []
    
    init(){
        getItem()
    }
    
    func getItem (){
        let newItems = [
            ItemModel(title: "First one", isCompleted: true),
            ItemModel(title: "Second toDo", isCompleted: true),
            ItemModel(title: "Third toDo", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet)
    {
        items.remove(atOffsets: indexSet)
        
    }
    
    func moveItem(from: IndexSet , to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}
