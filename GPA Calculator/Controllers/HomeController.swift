//
//  ViewController.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 22/5/23.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var avg4: UIButton!
    @IBOutlet weak var avg5: UIButton!
    @IBOutlet weak var avg100: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GPA"
      
    }

    @IBAction func avg4Tapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = vc.instantiateViewController(withIdentifier: "AvgViewController") as? AvgViewController else {
            return
        }
        controller.avgType = 4
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func avg5Tapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = vc.instantiateViewController(withIdentifier: "AvgViewController") as? AvgViewController else {
            return
        }
        controller.avgType = 5
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func avg100Tapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = vc.instantiateViewController(withIdentifier: "AvgViewController") as? AvgViewController else {
            return
        }
        controller.avgType = 100
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

