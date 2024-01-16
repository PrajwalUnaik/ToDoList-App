import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    
    var body: some View {
        ZStack {
            List{
                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation {
                                //
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }.listStyle(.plain)
                .navigationTitle("ToDo List 📝")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("Add", destination:AddView())
                )
        }
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
}


