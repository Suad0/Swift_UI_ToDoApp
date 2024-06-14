import SwiftUI

struct TeamView: View {
    
    var item: ToDoItem
    
    
    
    var body: some View {
        
        NavigationOptionsView()
        
        
    }
}




#Preview {
    TeamView(item: ToDoItem(name: "Sample", age: 25, members: 5))
}
