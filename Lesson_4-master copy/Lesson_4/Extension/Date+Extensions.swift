import Foundation

extension Date {
    
    var string: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        return formatter.string(from: self)
    }
    
}
