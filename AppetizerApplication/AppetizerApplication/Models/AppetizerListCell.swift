//
//  AppetizerListCell.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 4/25/24.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height:90, alignment:.center)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                Text("$\(appetizer.price, specifier: "%.2f")")
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
