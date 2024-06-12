//
//  EmptyState.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 6/5/24.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Image(imageName)
                    .resizable()
                    .frame(width: 300, height: 200)
                    .padding()
                Text(message)
                    .font(.title3)
                    .bold()
                    .italic()
                    .foregroundStyle(.secondary)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is our test message. I am making it a long message to text the multilineTextAlignment")
}
