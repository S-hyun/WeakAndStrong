//
//  ViewController.swift
//  CalliClock
//
//  Created by swuad_11 on 01/07/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var localeLabel: UILabel!
    @IBOutlet weak var current_time_Label: UILabel!
    @IBOutlet weak var h1: UIImageView!
    
    @IBOutlet weak var h2: UIImageView!
    @IBOutlet weak var hour: UIImageView!
    
    
    @IBOutlet weak var m1: UIImageView!
    
    @IBOutlet weak var m2: UIImageView!
    
    @IBOutlet weak var m3: UIImageView!
    @IBOutlet weak var min: UIImageView!
    
    
    @IBOutlet weak var s1: UIImageView!
    
    @IBOutlet weak var s2: UIImageView!
    
    @IBOutlet weak var s3: UIImageView!
    @IBOutlet weak var sec: UIImageView!
    
    
    var switch_value:Bool = false
    override func viewWillAppear(_ animated: Bool) {
        // 화면이 보이려고 하면
        super.viewWillAppear(animated)
        print("view will appear")
        // UserDefault를 사용해서 switch_value 값 불러오기
        guard let switch_value_object = UserDefaults.standard.object(forKey: "switch_value") else {
                return
        }
        
        self.switch_value = switch_value_object as! Bool
    }
    override func viewDidLoad() {
        // 앱을 켜서 화면이 첫 번째 뜨기 직전에 딱 1번
        super.viewDidLoad()
        setTimeLabel()
        
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTimeLabel), userInfo: nil, repeats: true)
        //image01.image = UIImage(named: "분")
        // 1. Label -> UIImageView 교체
        // 2. setTimwLabel 함수의 내용을 한글 -> 이미지로 교체
        // Do any additional setup after loading the view.
    }

    @objc func setTimeLabel(){
        // 현재 시간 불러오기
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)
        
        //print(components.hour, components.minute, components.second)
        
        let current_hour = components.hour!
        let current_min = components.minute!
        let current_sec = components.second!
        let hours = ["영", "한", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열", "열한", "열두"]
        let numbers = ["영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"]
        
        
        // 1. 적당히 글자 끊어서 넣어주기
        // 글자가 두 자리이냐? 아니냐에 따라서 분기
        if current_hour <= 4 {
            h2.image = UIImage(named: "\(hours[current_hour])")
            h1.image = UIImage(named: " ")
        } else  if (current_hour%12) <= 4{
            h2.image = UIImage(named:"\(hours[current_hour%12])")
            h1.image = UIImage(named: " ")
        } else  if current_hour == 5 || current_hour == 17{
            h1.image = UIImage(named:"다")
            h2.image = UIImage(named:"섯")
        } else  if current_hour == 6 || current_hour == 18{
            h1.image = UIImage(named:"여")
            h2.image = UIImage(named:"섯")
        } else  if current_hour == 7 || current_hour == 19{
            h1.image = UIImage(named:"일")
            h2.image = UIImage(named:"곱")
        } else  if current_hour == 8 || current_hour == 20{
            h1.image = UIImage(named:"여")
            h2.image = UIImage(named:"덟")
        } else  if current_hour == 9 || current_hour == 21{
            h1.image = UIImage(named:"아")
            h2.image = UIImage(named:"홉")
        } else  if current_hour == 10 || current_hour == 22{
            h1.image = UIImage(named: " ")
            h2.image = UIImage(named:"열")
        } else  if current_hour == 11 || current_hour == 23{
            h1.image = UIImage(named:"열")
            h2.image = UIImage(named: "한")
        } else  if current_hour == 12 || current_hour == 24{
            h1.image = UIImage(named:"열")
            h2.image = UIImage(named:"두")
        }
        hour.image = UIImage(named:"시")
        
    
        // 숫자가 10 이상일 때,
        if current_min > 20 {
            m1.image = UIImage(named:"\(numbers[current_min / 10] )")
            m2.image = UIImage(named:"십")
        } else if (current_min >= 10) && (current_min < 20){
            m1.image = UIImage(named: " ")
            m2.image = UIImage(named:"십")
        } else {
            m1.image = UIImage(named: " ")
            m2.image = UIImage(named: " ")
        }
        m3.image = UIImage(named:"\(numbers[current_min % 10])")
        min.image = UIImage(named:"분")
        
        if current_sec > 20{
        s1.image = UIImage(named:"\(numbers[current_sec / 10])")
        s2.image = UIImage(named:"십")
        } else if (current_sec >= 10) && (current_sec < 20){
            s1.image = UIImage(named: " ")
            s2.image = UIImage(named:"십")
        } else {
            s1.image = UIImage(named: " ")
            s2.image = UIImage(named: " ")
        }
        s3.image = UIImage(named:"\(numbers[current_sec % 10])")
        sec.image = UIImage(named:"초")
        
        
        let timestamp = DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .medium)
        if self.switch_value || (Locale.preferredLanguages[0] != "ko-KR"){
            self.current_time_Label.text = timestamp
            } else {
            self.current_time_Label.text = ""
            }
        
        
//        if Locale.preferredLanguages[0] != "ko-KR" {
//        let timestamp = DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .medium)
//        self.current_time_Label.text = timestamp
//        }
        
    }
}


