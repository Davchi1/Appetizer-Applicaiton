//
//  AppetizerListView.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 4/21/24.
//

import SwiftUI

struct AppetizerListView: View {
    // @State private var appetizers: [Appetizer] = []
    @StateObject var viewModel = AppetizerListViewModel()

    var body: some View {
        ZStack{

            NavigationView{
                List(viewModel.appetizers)  { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                      //      print("The selected Appetizer is now " + (viewModel.selectedAppetizer?.imageURL ?? "Not found"))
                            withAnimation(.smooth){
                                viewModel.isShowingDetailView.toggle()
                            }

                        }
                    
                }
                .navigationTitle("Appetizers")
                
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            .disabled(viewModel.isShowingDetailView)
            if(viewModel.isLoading){
                //Loading View
                LoadingView()
            }
            if(viewModel.isShowingDetailView){
                AppetizerDetail(selectedAppetizer: viewModel.selectedAppetizer ?? Appetizer(id: 2, name: "Appetizer not found", description: "Appetizer not found", price: 0, imageURL: "food-placeholder", calories: 0, protein: 0, carbs: 0), isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
        .alert(item: $viewModel.alertItem){alertItem in
            Alert(title: alertItem.title, message: alertItem.message,dismissButton: alertItem.dismissButton)
        }
        
    }
}



#Preview {
    AppetizerListView()
}
