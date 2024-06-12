//
//  xDismissButton.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 5/31/24.
//

import SwiftUI

struct xDismissButton: View {
    var body: some View {
        ZStack{
            Image(systemName: "xmark.circle.fill")
                .frame(width: 30, height: 30)
                .tint(.red)
        }
    }
}

#Preview {
    xDismissButton()
}
