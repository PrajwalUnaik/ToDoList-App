//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Prajwal U on 15/01/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
