//
//  addToOrderButton.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 5/31/24.
//

import SwiftUI

struct addToOrderFromDetailButton: View {
    @EnvironmentObject var order: Order
    let selectedAppetizerPrice: Double
    let selectedAppetizer: Appetizer
    var body: some View {
        Button("$\(selectedAppetizerPrice, specifier: "%.2f") - Add to Order", action: {
            order.addItemToOrder(item: selectedAppetizer)
        })
        .buttonStyle(.bordered)
        .frame(width: 260, height: 50)
        .padding()
        .tint(.brandPrimary)
    }
}

#Preview {
    addToOrderFromDetailButton(selectedAppetizerPrice: 2.5, selectedAppetizer: Appetizer(id: 2, name: "Dave", description: "Rave", price: 2.4, imageURL: "food-placeholder", calories: 5, protein: 2, carbs: 1))
}
