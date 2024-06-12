//
//  AccountView.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 4/21/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        //Text("Account View")
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstNameTextField)
                    TextField("Last Name", text: $viewModel.user.lastNameTextField)
                    TextField("Email", text: $viewModel.user.emailTextField)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthDate,  displayedComponents: .date)
                    Button(action: {
                        viewModel.saveChanges()
                        
                    }, label: {
                        Text("Save Changes")
                    })
                    .buttonBorderShape(.roundedRectangle)
                }
                Section(header: Text("Requests")){
                    Toggle(isOn: $viewModel.user.meetAtDoor, label: {
                        Text("Meet At Door")
                    })
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))

            }
            .navigationTitle("Accounts")
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AccountView()
}
