//
//  CalculationCell.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 27/5/23.
//

import UIKit

class CalculationCell: UITableViewCell {


    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var hourBtn: UIButton!
    @IBOutlet weak var gradeBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var resultDes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var tapForHour : (() -> Void)? = nil
    var tapForGrade : (() -> Void)? = nil
    var tapForPlus : (() -> Void)? = nil
    var tapForCalculate : (() -> Void)? = nil
    
    func setData(model : Grade) {
        nameTxt.text = model.name!
        
        if model.hour == nil {
            hourBtn.setTitle("Hour", for: .normal)
        } else {
            hourBtn.setTitle("\(model.hour!)  Hours", for: .normal)
        }
        
        if model.grade == nil {
            gradeBtn.setTitle("Grade", for: .normal)
        } else {
            gradeBtn.setTitle("\(model.grade!)  Grade", for: .normal)
        }
        
        hourBtn.addTarget(self, action: #selector(tapHour), for: .touchUpInside)
        gradeBtn.addTarget(self, action: #selector(tapGrade), for: .touchUpInside)
        plusBtn.addTarget(self, action: #selector(tapPlus), for: .touchUpInside)
    }
    
    
    func setFooter() {
        calculateBtn.addTarget(self, action: #selector(tapCalculate), for: .touchUpInside)
    }
    
    
    @objc func tapHour() {
        if let tap = tapForHour {
            tap()
        }
    }
    
    @objc func tapGrade() {
        if let tap = tapForGrade {
            tap()
        }
    }
    
    @objc func tapPlus() {
        if let tap = tapForPlus {
            tap()
        }
    }
    
    @objc func tapCalculate() {
        if let tap = tapForCalculate {
            tap()
        }
        
    }
    
//    @IBAction func hourBtnPressed(_ sender: Any) {
//    }
//
//    @IBAction func creditBtnPressed(_ sender: Any) {
//    }
//
//
//    @IBAction func plusBtnPressed(_ sender: Any) {
//    }
//
//    @IBAction func calculateBtnPressed(_ sender: Any) {
//    }
    
}
