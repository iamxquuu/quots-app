import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = AuthorModel()
    
    var body: some View {
        
        // NavigationView to go to detail view
        NavigationView {
            
            ScrollView {
                
                // VStack to group all the cards
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Card for each author
                    ForEach(model.authors) { a in
                        
                        // LInk to detail view
                        NavigationLink(
                            destination: DetailView(author: a),
                            label: {
                                
                                // Each author card in the scrollview
                                Card(author: a)
                            })
                        
                        
                        
                    }
                }
                
            }
            .navigationBarTitle("Authors")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
