//
//  ContentView.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 4/2/24.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var currentOrder: Order
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Account")
                }
           
            OrderView()
                .tabItem {
                    Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    Text("Order")
                }
                .badge(currentOrder.items.count)
            
        }
        .tint(.brandPrimary)

        
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
