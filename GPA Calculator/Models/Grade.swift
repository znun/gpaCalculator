//
//  Grade.swift
//  GPA Calculator
//
//  Created by Mahmudul Hasan on 29/5/23.
//

import Foundation
class Grade: Codable {
    var id: String?
    var name: String?
    var checked: Bool = false
    var hour : String?
    var grade : String?
    var point = 0.0
}
