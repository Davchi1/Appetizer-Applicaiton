//
//  AppetizerApplicationApp.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 4/2/24.
//

import SwiftUI

@main
struct AppetizerApplicationApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
