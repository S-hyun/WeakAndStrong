//
//  ViewController.swift
//  FirebaseDBBasic
//
//  Created by swuad_11 on 04/07/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource {
    var book_data:[NSDictionary] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.loadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //saveData()
        //updateValue()
        // 데이터 베이스 초기화
        //let ref = Database.database().reference()
        //ref.child("books").setValue(nil)
        loadData()
    }
    
    func updateValue() {
        let ref = Database.database().reference()
        ref.child("books/-Liv-dtMlJ8YdGiah3wh/published").setValue(2005)
    }

    func loadData() {
       
        let ref = Database.database().reference()
        ref.child("books").observeSingleEvent(of: .value, with: {
            (snapshot) in
             self.book_data = []
            for data in (snapshot.value as! NSDictionary){
                let key = data.key as! String
                let value = data.value as! NSDictionary
                self.book_data.append([key:value] as! NSDictionary)
            }
            self.tableView.reloadData()
        })
    }
    
    func saveData(){
        // 데이터 베이스 시작점
        let ref = Database.database().reference()
        let key = ref.child("books").childByAutoId().key!
        
        ref.child("books/\(key)").setValue(["author" : "루이스 코저", "published" : 1976, "title" : "사회사상가"])

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.book_data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell" , for: indexPath) as! BookCell
        let row = indexPath.row
        
        let key = self.book_data[row].allKeys[0] as! String
        let data = self.book_data[row][key] as! NSDictionary
        
        cell.infoTextField.text = "\(data["title"]!), \(data["published"]!), \(data["author"]!)"
        
        return cell
    }
}

