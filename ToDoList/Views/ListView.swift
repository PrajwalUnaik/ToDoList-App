import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            List {
                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation {
                                // Handle tap gesture (e.g., show details or perform an action)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem) // Swipe to delete
                .onMove(perform: listViewModel.moveItem) // Reorder items
            }.listStyle(.plain)
            .navigationTitle("ToDo List 📝") // Set navigation title
            .navigationBarItems(
                leading: EditButton(), // Edit button for reordering and deletion
                trailing: NavigationLink("Add", destination: AddView()) // Navigation link to AddView for adding new items
            )
        }
    }
}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel()) // Inject ListViewModel as environment object
}
