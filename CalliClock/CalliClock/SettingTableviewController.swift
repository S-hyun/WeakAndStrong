//
//  SettingTableviewController.swift
//  CalliClock
//
//  Created by swuad_11 on 02/07/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit

class SettingTableviewController: UITableViewController {
    
    

    
    @IBOutlet weak var onOFFSwitch: UISwitch!
    
    override func viewDidLoad() {
        
//        if UserDefaults.standard.bool(forKey: "switch_value"){
//            onOFFSwitch.isOn = true
//        } else {
//            onOFFSwitch.isOn = false
//        }
        guard let switch_value_obj = UserDefaults.standard.object(forKey: "switch_value")else{
            UserDefaults.standard.set(false, forKey: "switch_value")
            print("default save")
            return
        }
        /*
         guard let 변수명 = 옵셔널 값 else {
            옵셔넝 값이 nil일 경우 실행 구문
            return
         }
         
         */
        self.onOFFSwitch.isOn = (switch_value_obj as! Bool)
    }
    
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        print(sender.isOn)
        
        UserDefaults.standard.set(sender.isOn, forKey: "switch_value")
        
        // 실제로 파일에 저장하기
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.bool(forKey: "switch_value")
        
        
        
//        // sample이라는 키값에 test라는 문자열 저장하기
//        UserDefaults.standard.set("test", forKey: "sample")
//        UserDefaults.standard.set(true, forKey: "sample")
//        //저장된 값 불러오기
//        UserDefaults.standard.bool(forKey: "sample_bool")
//        UserDefaults.standard.string(forKey: "sample")
//        //값이 있나 확인하기
//        if UserDefaults.standard.object(forKey: "sample") != nil{
//
//        }
    }
    
    
    
    
    
    
}
