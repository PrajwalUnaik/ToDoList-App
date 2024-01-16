//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Prajwal U on 16/01/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var isAnimate : Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("No ToDo found!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                Text("Tap the 'Add' button in the top-right or below to add items to your ToDo list.")
                    .multilineTextAlignment(.center)
                    .padding(20)

                NavigationLink(destination: AddView()) {
                    Text("Add a new ToDo Mate")
                        .shadow(radius: 10)
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isAnimate ? .green : .accentColor)
                        .cornerRadius(10)
                        .padding()
                }.shadow(color: isAnimate ? Color.green.opacity(0.7) : Color.accentColor.opacity(0.7), radius: isAnimate ? 30 : 10 , y: isAnimate ? 50 : 30)
                .padding(.horizontal , isAnimate ? 35 : 40)
                .scaleEffect(isAnimate ? 1.025 : 1.0)
                .offset(y : isAnimate ? -5 : 0)
                
            }.multilineTextAlignment(.center)
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 40, trailing: 20))
            .onAppear {addAnimation()}
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !isAnimate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            withAnimation(
            Animation
                .easeInOut(duration: 2)
                .repeatForever()
            )
            {
                isAnimate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}
