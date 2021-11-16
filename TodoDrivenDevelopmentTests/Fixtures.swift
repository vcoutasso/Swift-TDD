//
//  Fixtures.swift
//  TodoDrivenDevelopmentTests
//
//  Created by Vinícius Couto on 16/11/21.
//

@testable import TodoDrivenDevelopment

enum Fixtures {
    struct Tasks {
        static let todo = TodoTask(task: "fixture todo task", status: .todo)
        static let done = TodoTask(task: "fixture done task", status: .done)
    }
}
