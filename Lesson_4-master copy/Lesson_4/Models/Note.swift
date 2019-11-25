//
//  Note.swift
//  Lesson_4
//
//  Created by Maxim Vitovitsky on 12.11.2019.
//  Copyright © 2019 NapoleonIT. All rights reserved.
//

import Foundation

class Note {
    
    var id: String
    var title: String
    var text: String
    var date: Date
    
    init(id: String, data: JSON) {
        self.id = id
        self.title = data["title"] as! String
        self.text = data["text"] as! String
        self.date = (data["date"] as! String).date
    }
    
}

extension Note: CustomDebugStringConvertible {

    var debugDescription: String {
        "\(title): \(text)"
    }

}
