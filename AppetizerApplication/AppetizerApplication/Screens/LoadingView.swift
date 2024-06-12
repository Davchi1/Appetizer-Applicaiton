//
//  LoadingView.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 5/29/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            Text("Retrieving Appetizers...")
                .padding()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
                .tint(.blue)
        }    }
}

#Preview {
    LoadingView()
}
