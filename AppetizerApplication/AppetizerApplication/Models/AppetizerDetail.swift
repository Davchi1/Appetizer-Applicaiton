//
//  AppetizerDetail.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 5/25/24.
//

import SwiftUI
struct AppetizerDetail: View {
    var selectedAppetizer: Appetizer
    @Binding var isShowingDetailView:Bool
    var body: some View {
        @EnvironmentObject var order: Order
        VStack{
            AppetizerRemoteImage(urlString: selectedAppetizer.imageURL)
                 .aspectRatio(contentMode: .fill)
                 .frame(width:310 ,height: 235, alignment: .center)
                 .padding()
            Text(selectedAppetizer.name)
                .bold()
                .font(.title2)
                .italic()
                .padding()
                .padding()
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Text(selectedAppetizer.description)
                .padding()
                .font(.body)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                
            
            HStack(spacing: 30){
                VStack{
                    Text("Calories")
                        .font(.caption)
                        .bold()
                    Text(String(selectedAppetizer.calories))
                        .foregroundStyle(.gray)
                        .italic()
                }
                .padding()
                VStack{
                    Text("Carbs")
                        .font(.caption)
                        .bold()
                    
                    Text(String(selectedAppetizer.carbs))
                        .foregroundStyle(.gray)
                        .italic()
                }
                .padding()
                VStack{
                    Text("Proteins")
                        .font(.caption)
                        .bold()
                    Text(String(selectedAppetizer.protein))
                        .foregroundStyle(.gray)
                        .italic()

                }
                .padding()
          
            }
            Spacer()
            addToOrderFromDetailButton(selectedAppetizerPrice: selectedAppetizer.price, selectedAppetizer: selectedAppetizer)
            


        }
        .frame(width: 310, height: 625)
        .shadow(radius: 40)
        .border(.brandPrimary, width: 1)
        .cornerRadius(3)
        .background(Color(.systemBackground))
        .overlay(
            Button(action: {
                withAnimation(.default) {
                    isShowingDetailView.toggle()
                    
                }
        }, label: {
           xDismissButton()
        }),alignment: .topTrailing)
        
        
    }
}
    #Preview {
        AppetizerDetail(selectedAppetizer: Appetizer(id: 2, name: "Chicken Wings", description: "You'll need extra napkins with these tasty treats or sleep with tasty feet", price: 11.49, imageURL: "food-placeholder", calories: 700, protein: 13, carbs: 11),isShowingDetailView: .constant(true))
            .environmentObject(Order())
    }

