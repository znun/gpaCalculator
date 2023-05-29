//
//  ValueSelectionController.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 29/5/23.
//

import UIKit

class ValueSelectionController: UITableViewController {
    
    var isGrade : Bool = false
    var list: [Grade] = [Grade]()
    var selectedString : String?
    var delegate : CallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureValue()
        
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
    }
    
    func configureValue() {
        self.list.removeAll()
        if isGrade {
            self.navigationItem.title = "Select Grade"
            for i in 0...11 {
                let model = Grade()
                model.id = "\(i)"
                if i == 0 {
                    model.name = "A"
                } else if i == 1 {
                    model.name = "A-"
                } else if i == 2 {
                    model.name = "B+"
                }
                else if i == 3 {
                    model.name = "B"
                }
                else if i == 4 {
                    model.name = "B-"
                }
                else if i == 5 {
                    model.name = "C+"
                }
                else if i == 6 {
                    model.name = "C"
                }
                else if i == 7 {
                    model.name = "C-"
                }
                else if i == 8 {
                    model.name = "D+"
                }
                else if i == 9 {
                    model.name = "D"
                }
                else if i == 10 {
                    model.name = "D-"
                }
                else if i == 11 {
                    model.name = "F"
                }
                if selectedString != nil && model.name == selectedString! {
                    model.checked = true
                }
                list.append(model)
            }
          
        } else {
            self.navigationItem.title = "Select Hour"
            for i in 0...4 {
                let model = Grade()
                model.id = "\(i)"
                model.name = "\(i)"
                list.append(model)
            }
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].name!
        if list[indexPath.row].checked {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        delegate?.callBack(str: list[indexPath.row].name!)
        self.navigationController?.popViewController(animated: true)
    }
}
