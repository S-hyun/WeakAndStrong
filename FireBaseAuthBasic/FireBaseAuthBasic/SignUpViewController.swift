//
//  SignUpViewController.swift
//  FireBaseAuthBasic
//
//  Created by swuad_11 on 03/07/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController : UIViewController {
    
    @IBOutlet weak var mkid: UITextField!
    
    @IBOutlet weak var mkpwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupComplete(_ sender: UIButton) {
        print("회원가입 완료")
        
        Auth.auth().createUser(withEmail: self.mkid.text!, password: self.mkpwd.text!) {
            authResult, error in
            guard let authResult = authResult, error == nil else{
                print("회원 가입 실패")
                return
            }
            // 회원가입 성공 후 처리 로직
            print("회원 가입 성공")
        }
        // 화면 이동
        let mainViewController = self.storyboard?.instantiateViewController(withIdentifier:"main")
        
        // 만약 네비게이션 컨트롤러 없이 이전 화면으로 돌아가고 싶을 때
        // self.dismiss(animated: false, completion: nil)
        mainViewController?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(mainViewController!, animated: true, completion: nil)
    }
    
}

