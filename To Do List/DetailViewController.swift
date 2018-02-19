//
//  DetailViewController.swift
//  To Do List
//
//  Created by Yu Chang on 2/17/18.
//  Copyright © 2018 ISclass. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoNoteView: UITextView!
    // MARK: Global Var
    var toDoItem: String?
    var toDoNoteItem: String?
    // MARK: Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        //toDoField.becomeFirstResponder()
        if let toDoItem = toDoItem, let toDoNoteItem = toDoNoteItem {
            toDoField.text = toDoItem
            toDoNoteView.text = toDoNoteItem
            self.navigationItem.title = "Edit To Do Item"
        } else {
            self.navigationItem.title = "New To Do Item"
        }
        enableDisableSaveButton()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    // MARK: func
    func enableDisableSaveButton () {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    // MARK: IBActions
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
