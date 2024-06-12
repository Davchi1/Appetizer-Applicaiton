//
//  AppetizerListViewModel.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 5/20/24.
//

import Foundation
import SwiftUI
final class AppetizerListViewModel: ObservableObject{
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading:Bool = false
    @Published var isShowingDetailView = false;
    @Published var selectedAppetizer: Appetizer?
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { (result) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error{
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete

                    }
                }
            
            }

        }
    }

}

