//
//  AddBookViewController.swift
//  FirebaseDBBasic
//
//  Created by swuad_11 on 04/07/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddBookViewController:UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var authorTextField: UITextField!
    
    @IBOutlet weak var publishedTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Book"
        let saveBtn = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(saveBook))
        self.navigationItem.rightBarButtonItem = saveBtn
    }
    
    @objc func saveBook(){
        print("save book")
        let ref = Database.database().reference()
        let key = ref.child("Books").childByAutoId().key!
        let author = self.authorTextField.text!
        let published = self.publishedTextField.text!
        let title = self.titleTextField.text!
        ref.child("books/\(key)").setValue(["author" : author, "published" : published, "title" : title])
        self.navigationController?.popViewController(animated: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
