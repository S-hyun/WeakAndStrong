//
//  ViewController.swift
//  Lottodraw
//
//  Created by swuad_11 on 27/06/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var lottoNumber:[[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottoDraw()
        // Do any additional setup after loading the view.
    }
    
    func lottoDraw() {
        //var numbers:[Int] = []
        //번호 6개뽑기
//        let number = Int.random(in : 1...45)
//            numbers.append(number)
        //5게임 뽑기
        for _ in 1...5 {
            var numbers : Set<Int> = []
            while numbers.count < 6 {
                var number = Int.random ( in : 1...45)
                numbers.insert(number)
            }
            //lottoNumbers에 저장
            lottoNumber.append(Array<Int>(numbers.sorted()))
        }

    }
    
    //테이블 뷰에 섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //한 섹션당 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //셀 개수 리턴
    }
    
    //셀 내용 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LottoCell", for: indexPath) as! LottoCell
        
        let row = indexPath.row
        //row = 0, 1, 2, 3, 4
        cell.number1.text = "\(lottoNumber[row][0])"
        cell.number2.text = "\(lottoNumber[row][1])"
        cell.number3.text = "\(lottoNumber[row][2])"
        cell.number4.text = "\(lottoNumber[row][3])"
        cell.number5.text = "\(lottoNumber[row][4])"
        cell.number6.text = "\(lottoNumber[row][5])"
        
        return cell
    }
}


