//
//  CalculationViewController.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 27/5/23.
//

import UIKit

class CalculationViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{

    //@IBOutlet weak var ads: UIView!
   // @IBOutlet weak var nameLbl: UILabel!
    //@IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var avgType: Int = 4
    var list: [Grade] = [Grade]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "New Stork"
       
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        
        configureTable()
    }
    
    func configureTable() {
        let model = Grade()
        model.id = "\(list.count + 1)"
        model.name = ""
        list.append(model)
        
        self.tableView.reloadData()
        
    }
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == list.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "footer") as! CalculationCell
            cell.setFooter()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CalculationCell
            if indexPath.row == list.count -  1 {
                cell.plusBtn.isHidden = false
            } else {
                cell.plusBtn.isHidden = true
            }
                
            cell.setData(model: list[indexPath.row])
            cell.tapForPlus = {
                self.configureTable()
            }
            return cell
        }
      
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 220
//    }
    

    func tableView(_ tableView: UITableView, estimatedheightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
