//
//  NoteViewController.swift
//  Kosupure
//
//  Created by Rido Hendrawan on 27/04/22.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
//    public var date: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
//        dateLabel.text = date
        noteLabel.text = note
    }
    

}
