//
//  ViewController.swift
//  memoapp
//
//  Created by swuad_11 on 27/06/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var memoTextField: UITextField!
    var memoText:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveMemo(_ sender: UIButton) {
        print("click save")
        self.memoText = self.memoTextField.text!
    }
    @IBAction func loadMemo(_ sender: UIButton) {
        self.memoTextField.text = self.memoText
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.memoTextField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

