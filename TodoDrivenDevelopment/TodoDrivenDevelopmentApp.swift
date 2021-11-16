//
//  TodoDrivenDevelopmentApp.swift
//  TodoDrivenDevelopment
//
//  Created by Vinícius Couto on 16/11/21.
//

import SwiftUI

@main
struct TodoDrivenDevelopmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
