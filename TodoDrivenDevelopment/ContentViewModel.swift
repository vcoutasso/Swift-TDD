//
//  ContentViewModel.swift
//  TodoDrivenDevelopment
//
//  Created by Vinícius Couto on 16/11/21.
//

import Foundation

struct TodoTask: Identifiable, Equatable {
    var id: UUID = .init()
    var task: String
    var status: TaskStatus
}

enum TaskStatus {
    case todo
    case done
}

protocol ContentViewModelProtocol: ObservableObject {
    var todoList: [TodoTask] { get }

    func add(task: TodoTask)
    func removeTask(id: UUID)
    func toggleStatus(id: UUID)
    func updateTask(id: UUID, with string: String)
}

final class ContentViewModel: ContentViewModelProtocol {
    @Published var todoList: [TodoTask] = []

    func add(task: TodoTask) {
        todoList.append(task)
    }

    func removeTask(id: UUID) {
        guard let index = todoList.firstIndex(where: { $0.id == id }) else { return }
        todoList.remove(at: index)
    }

    func toggleStatus(id: UUID) {
        guard let index = todoList.firstIndex(where: { $0.id == id }) else { return }
        todoList[index].status = todoList[index].status == .todo ? .done : .todo
    }

    func updateTask(id: UUID, with string: String) {
        guard let index = todoList.firstIndex(where: { $0.id == id }) else { return }
        todoList[index].task = string
    }
}
