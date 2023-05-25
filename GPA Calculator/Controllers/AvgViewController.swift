//
//  AvgViewController.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 25/5/23.
//

import UIKit

class AvgViewController: UIViewController {

    var avgType: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if avgType == 4 {
            self.navigationItem.title = "Average of 4"
        } else if avgType == 5 {
            self.navigationItem.title = "Average of 5"
        } else if avgType == 100 {
            self.navigationItem.title = "Average of 100"
        }
        
    }

}
