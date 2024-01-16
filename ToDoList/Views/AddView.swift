//
//  AddView.swift
//  ToDoList
//
//  Created by Prajwal U on 15/01/24.
//

import SwiftUI

struct AddView: View {
    
    // MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack {
                // Textfield for user input
                TextField("Type your ToDo here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(10)
                
                // Button to save the entered item
                Button(action: saveButtonPress) {
                    Text("Save".uppercased())
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
            }.padding(14)
        }.navigationTitle("Add a ToDo 🖊️")
    }
    
    // MARK: - Save Button Action
    
    /// Function to handle the save button press
    func saveButtonPress() {
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
    
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
}
