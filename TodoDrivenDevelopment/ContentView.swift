//
//  ContentView.swift
//  TodoDrivenDevelopment
//
//  Created by Vinícius Couto on 16/11/21.
//

import SwiftUI


struct ContentView<ViewModelType>: View where ViewModelType: ContentViewModelProtocol {
    @ObservedObject var viewModel: ViewModelType

    var body: some View {
        VStack {
            ForEach(viewModel.todoList) {
                Image(systemName: "circle")
                    .foregroundColor($0.status == .todo ? .red : .green)
                Text($0.task)
                Divider()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
