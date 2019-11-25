import Foundation

extension String {
    
    var date: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyy HH:mm"
        
        return formatter.date(from: self)!
    }
    
}
