//
//  ViewController.swift
//  Lesson_4
//
//  Created by Maxim Vitovitsky on 12.11.2019.
//  Copyright © 2019 NapoleonIT. All rights reserved.
//

import UIKit

class NotesListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let names = ["Alex", "Sergey", "Max", "Andrey", "Vlad"]
        let i = Int(arc4random_uniform(UInt32(names.count)))
        let title = "\(names[i])"
        let text = "89\(Int.random(in: 100000000...999999999))"
        API.createNote(title: title, text: text) { result in
            guard result else { return }
            API.loadNotes { notesArray in
                self.notes = notesArray
            }
        }
    }

}

extension NotesListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteCell
        cell.setup(with: notes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
