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
        
        configureNavigationIcon()
        
    }
    
    func configureNavigationIcon() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(handleSetting))
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    @objc func handleSetting() {
        let vc = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = vc.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else {
            return
        }
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}
