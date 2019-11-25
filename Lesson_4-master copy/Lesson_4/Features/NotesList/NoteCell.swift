//
//  NoteCell.swift
//  Lesson_4
//
//  Created by Maxim Vitovitsky on 12.11.2019.
//  Copyright © 2019 NapoleonIT. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setup(with note: Note) {
        titleLabel.text = note.title
        bodyLabel.text = note.text
        dateLabel.text = note.date.string
    }
    
}
