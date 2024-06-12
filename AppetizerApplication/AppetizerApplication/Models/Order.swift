//
//  Order.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 6/8/24.
//

import Foundation
import SwiftUI

final class Order: ObservableObject{
    @Published var items: [Appetizer] = []
    @Published var orderTotal: Double = 0;
    @Published  var alertItem: AlertItem?

    func addItemToOrder(item: Appetizer){
        items.append(item)
        orderTotal += item.price
    }
   
    func calculateTotal() -> Double{
        var tempTotal = 0.0;
        for appetizer in items {
            tempTotal += appetizer.price
        }
        return tempTotal
    }
    
    func completeOrder(){
        if(items.isEmpty){
            alertItem = AlertContext.unsuccesfulOrder
        }
        else{
            items.removeAll()
            orderTotal = 0
            alertItem = AlertContext.successfulOrder
        }

    }
    
}



















