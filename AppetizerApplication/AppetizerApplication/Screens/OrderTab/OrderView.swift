//
//  OrderView.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 4/21/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var currentOrder: Order
    //@StateObject var viewModel = AccountViewModel()
    @State var orderTotal: Double = 0
    
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack{
                    List {
                        ForEach(currentOrder.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                        }
                        .onDelete(perform: { indexSet in
                            currentOrder.items.remove(atOffsets: indexSet)
                            currentOrder.orderTotal = currentOrder.calculateTotal()
                        })
                        
                        if(currentOrder.items.isEmpty){
                            EmptyState(imageName: "empty-order", message: "There are currently no items in the cart")
                                .frame(width: 300,height: 700)
                                .offset(CGSize(width: 25.0, height: 25.0))
                            
                        }
                        
                    }
                    .listStyle(.plain)
                    Button("$\(currentOrder.orderTotal, specifier: "%.2f") - Checkout" ){
                        currentOrder.completeOrder()
                    }
                    .buttonStyle(BorderedButtonStyle())
                    .tint(.brandPrimary)
                    .padding()
                }
                .navigationTitle("Cart")


            }
            
        }
        .alert(item: $currentOrder.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
}





#Preview {
    OrderView()
        .environmentObject(Order())
}
