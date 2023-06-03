//
//  CalculationViewController.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 27/5/23.
//

import UIKit

class CalculationViewController: UIViewController, UITableViewDelegate , UITableViewDataSource, ValueSelectionDelegate{

    //@IBOutlet weak var ads: UIView!
   // @IBOutlet weak var nameLbl: UILabel!
 

   
    @IBOutlet weak var tableView: UITableView!
    
    var avgType: Int = 4
    var isGrade: Bool = false
    var indexPath: IndexPath?
    var list: [Grade] = [Grade]()
    
    var resultString : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "New Stork"
       
        self.TapToHideKeyboard()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        
        configureTable()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWilHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    func configureTable() {
        let model = Grade()
        model.id = "\(list.count + 1)"
        model.name = ""
        list.append(model)
        
        self.tableView.reloadData()
        
    }
    
    var isScrolled : Bool = false
    
    @objc func keyboardWillShow(_ notification : NSNotification) {
        if !self.isScrolled {
            self.tableView.contentSize = CGSize(width: 0, height: self.tableView.contentSize.height + 270.0)
            self.isScrolled = true
        }
    }
    
    
    @objc func keyboardWilHide(_ notification : NSNotification) {
       
            self.tableView.contentSize = CGSize(width: 0, height: self.tableView.contentSize.height - 270.0)
            self.isScrolled = true
        
    }
    
    func calculateResult() {
        let totalRows = tableView.numberOfRows(inSection: 0)
        var sumOfHours : Double = 0.0
        var sumOfPoints : Double = 0.0
        for row in 0..<totalRows {
            print("row \(row)")
            guard let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? CalculationCell else {
                return
            }
            if cell.reuseIdentifier != nil && cell.reuseIdentifier == "cell" {
                if list[row].hour != nil {
                    sumOfHours = sumOfHours + Double(list[row].hour!)!
                }
                if list[row].grade != nil {
                    sumOfPoints = sumOfPoints + Double(list[row].point)
                } else {
                    alert(message: "Please select grade for processing the calculation")
                    return
                }
                if cell.nameTxt.text == nil || cell.nameTxt.text!.isEmpty{
                    alert(message: "Please Enter Subject Name for processing the calculation")
                    return
                }
               
            }
        }
        
        print("HOURS = \(sumOfHours) & POINTS \(sumOfPoints)")
        let gpa = sumOfPoints / sumOfHours
        let actualGPA = String(format: "%.2f", gpa)
        let message = "G.P.A. = \(actualGPA) \nThis is the result"
        self.resultString = message
        self.tableView.reloadData()
        alert(message: message)
        print("Total Point: \(gpa)")
    }
    
    func alert(message: String){
        let controller = UIAlertController(title: "Result is here", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            
            //Cancel Action
        }))
        self.present(controller, animated: true, completion: nil)
    }
    
    func result(message: String){
        let controller = UIAlertController(title: "Result is Here", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            
            //Cancel Action
        }))
        self.present(controller, animated: true, completion: nil)
    }
    
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count + 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "footer") as! CalculationCell
        cell.resultDes.text = resultString
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if resultString == nil {
            return 0
        }
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == list.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "calculation") as! CalculationCell
            cell.setFooter()
            cell.tapForCalculate = {
                self.calculateResult()
            }
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
            
            cell.tapForHour = {
                self.list[indexPath.row].name = cell.nameTxt.text!
                self.indexPath = indexPath
                self.isGrade = false
                let vc = UIStoryboard(name: "Main", bundle: nil)
                guard let controller = vc.instantiateViewController(withIdentifier: "ValueSelectionController") as? ValueSelectionController else {
                    return
                }
                if self.list[indexPath.row].hour != nil {
                    controller.selectedString = self.list[indexPath.row].hour!
                }
                controller.delegate = self
                controller.isGrade = self.isGrade
                var avgType: Int = 4
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
            cell.tapForGrade = {
                self.list[indexPath.row].name = cell.nameTxt.text!
                self.indexPath = indexPath
                self.isGrade = true
                let vc = UIStoryboard(name: "Main", bundle: nil)
                guard let controller = vc.instantiateViewController(withIdentifier: "ValueSelectionController") as? ValueSelectionController else {
                    return
                }
                if self.list[indexPath.row].grade != nil {
                    controller.selectedString = self.list[indexPath.row].grade!
                }
                controller.delegate = self
                controller.isGrade = self.isGrade
                controller.avgType = self.avgType
                self.navigationController?.pushViewController(controller, animated: true)
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
    
    func callBack(str: String, point: Double) {
        if isGrade {
            list[self.indexPath!.row].grade = str
            list[self.indexPath!.row].point = point
        } else {
            list[self.indexPath!.row].hour = str
        }
        tableView.reloadRows(at: [self.indexPath!], with: .none)
    }
}
