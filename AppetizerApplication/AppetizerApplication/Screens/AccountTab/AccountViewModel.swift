//
//  AccountViewModel.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 6/1/24.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    @AppStorage("user") private var userData: Data?
    
    @Published  var user = User()
    @Published  var meetAtDoor = false
    @Published  var alertItem: AlertItem?
    var isValidForm: Bool {
        //Check text fields are not empty
        guard !user.firstNameTextField.isEmpty && !user.lastNameTextField.isEmpty && !user.emailTextField.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }
        
        //Email Check uses reg expression to guarantee "___@___.com"
        guard user.emailTextField.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
    
        return true
    }
    
    func retrieveUser(){
        guard let userData = userData else { return }
        
        do{
            //Try to decode a user from saved data
            user = try JSONDecoder().decode(User.self, from: userData)
        }
        //If there is no saved data from the user... user should be the original empty Object
        catch{
            alertItem = AlertContext.invalidUserData
        }
        
    }
    
    func saveChanges(){
        guard isValidForm else { return }
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
        print("Changes have been succesfully saved.")

    }
}
