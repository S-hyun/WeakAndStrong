//
//  ViewController.swift
//  FireBaseAuthBasic
//
//  Created by swuad_11 on 03/07/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pwd: UITextField!
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let currentUser = user {
                // 회원 로그인이 되어 있는 경우
                print("username", currentUser.displayName)
                let mainViewController = self.storyboard?.instantiateViewController(withIdentifier:"main")
                mainViewController?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(mainViewController!, animated: true, completion: nil)            } else {
                // 로그인이 아닌 경우
                print("not login")
            }
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doLogin(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.id.text!, password: self.pwd.text!){
            [weak self] use, error in
            guard let thisSelf = self else{
                return
            }
            if let error = error{
                print("로그인 에러")
                return
            }
            print("로그인 성공")
            // 메인 화면으로 이동
            let mainViewController = thisSelf.storyboard?.instantiateViewController(withIdentifier:"main")
            mainViewController?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            thisSelf.present(mainViewController!, animated: true, completion: nil)
        }
    }
    

}

