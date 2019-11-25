import Foundation

typealias JSON = [String : Any]

enum API {
    
    static var identifier: String { "MOWENIK" }
    static var baseURL: String { "https://ios-napoleonit.firebaseio.com/data/\(identifier)/" }
    
    static func loadNotes(completion: @escaping ([Note]) -> Void) {
        let url = URL(string: baseURL + ".json")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? JSON
            else { return }
            
            let notesJSON = json["notes"] as! JSON
            var notes = [Note]()
            
            for note in notesJSON {
                notes.append(Note(id: note.key, data: note.value as! JSON))
            }
            
            notes.sort { $1.date < $0.date }
            
            DispatchQueue.main.async {
                completion(notes)
            }
        }
        task.resume()
    }
    
    static func createNote(title: String, text:String, completion: @escaping (Bool) -> Void) {
        
        let params = [
            "title": title,
            "text":text,
            "date": Date().string
        ]
        	
        let url = URL(string: baseURL + "/notes.json")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = try?
            JSONSerialization.data(withJSONObject: params)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in completion(error == nil)
        }
        task.resume()
    }
}
