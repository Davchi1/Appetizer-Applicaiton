//
//  User.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 6/1/24.
//

import Foundation

struct User: Codable {
    var firstNameTextField = ""
    var lastNameTextField = ""
    var emailTextField = ""
    var birthDate = Date()
    var meetAtDoor = false
}
