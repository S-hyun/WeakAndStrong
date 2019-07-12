//
//  ViewController.swift
//  CoreDataBasic
//
//  Created by swuad_11 on 02/07/2019.
//  Copyright © 2019 swuad_11. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    var colors:[NSManagedObject] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = (self.colors[row].value(forKey: "code") as! String)
        return cell
    }
    

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let row = indexPath.row
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let context = appDelegate.persistentContainer.viewContext
            context.delete(self.colors[row])
            do {
                try context.save()
            } catch {
                print("삭제 오류")
            }
            self.colors.remove(at: row)
            tableView.reloadData()
        }
    }

   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Favorite Colors"
        self.loadColors()
        
    }
    /*
     어떤 데이터를 저장하기 위해 사용할 수 있는 방법
     1. 기본 변수 사용 방법 : 상태 유지 불가능
     2. 기본 데이터 베이스 : FMDB (범용 - query문을 알야 한다.)
     3. UserDefault : 가벼운 데이터를 저장할 때 편리
     4. CoreData : iOS 자체적으로 지원해주는 DB 형태
     */
    
    

    @IBAction func addColor(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Color", message: "write favorite color", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        
        let addAction = UIAlertAction(title: "Add", style: .default){
            [unowned self] action in
            guard let textField = alert.textFields?.first, let colorName = textField.text else {
                return
            }
            self.saveColor(color: colorName)
            // 입력받은 내용을 변수에 추가하기
            // 테이블 데이터 reload
        }
        
        alert.addTextField()
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    func saveColor(color: String){
//      1. AppDelegate 찾기
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        //2. context 찾기
        let context = appDelegate.persistentContainer.viewContext
        //3. entity 열기
        let entity = NSEntityDescription.entity(forEntityName: "Color", in: context)!
        //4. 오브젝트 만들기
        let color_obj = NSManagedObject(entity: entity, insertInto: context)
        //5. context 저장하기
        color_obj.setValue(color, forKey: "code")
        do{
            try context.save()
            self.colors.append(color_obj)
        } catch {
            NSLog("저장 오류")
        }
        self.tableView.reloadData()
        
    }
    
    func loadColors() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        // data load
        let request = NSFetchRequest<NSManagedObject>(entityName: "Color")
        do {
            self.colors = try context.fetch(request)
        } catch {
            print("data error")
        }
        
        self.tableView.reloadData()
    }
 
}

