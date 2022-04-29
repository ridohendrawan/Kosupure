//
//  EntryViewController.swift
//  Kosupure
//
//  Created by Rido Hendrawan on 27/04/22.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet var eventName: UITextField!
    @IBOutlet var eventDate: UITextField!
    @IBOutlet var eventNote: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        createDatePicker()
    }
    
    @objc func didTapSave () {
        if let text = eventName.text, !text.isEmpty, ((eventDate.text?.isEmpty) != nil), !eventNote.text.isEmpty {
            completion?(text, eventNote.text)
        }
    }
    
    func createDatePicker() {
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        //assign toolbar
        eventDate.inputAccessoryView = toolbar
        //assign date picker to the text field
        eventDate.inputView = datePicker
        //onlyshowdate
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        //formater
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        eventDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

}
