//
//  Utils.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 29/5/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func TapToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}
