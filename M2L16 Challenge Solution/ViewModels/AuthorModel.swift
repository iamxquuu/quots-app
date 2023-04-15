
import Foundation

class AuthorModel: ObservableObject {
    
    @Published var authors = [Author]()
    
    init() {
        // Get authors from local JSON
        self.authors = getLocalJson()
    }
    
    func getLocalJson() -> [Author] {
        
        // Get path in app bundle
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        if let pathString = pathString {
        
            // Create URL object
            let url = URL(fileURLWithPath: pathString)
            
            do {
                // Create Data object
                let data = try Data(contentsOf: url)
                
                // Decode the json data
                let decoder = JSONDecoder()
                var authors = try decoder.decode([Author].self, from: data)
                
                // Add UUID to author instances
                for index in 0..<authors.count {
                    authors[index].id = UUID()
                }
                
                return authors
            }
            catch {
                print("error")
            }
        }
        
        return [Author]()
    }
}
