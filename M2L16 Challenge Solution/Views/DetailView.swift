import SwiftUI

struct DetailView: View {
    
    var author: Author?

    var body: some View {
        
        // If no meditation set, can't display detail
        if let author = author  {
        
            VStack(alignment: .leading, spacing: 20.0) {
               
                
                // Author name
                Text(author.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Quotes
                ForEach (author.quotes, id: \.self) { quote in
                    Text(quote)
                }
            
                Spacer()
                
            }.padding()
        }
    }
    
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(author: Author.testData())
    }
}
