//
//  ContentViewModelTests.swift
//  TodoDrivenDevelopmentTests
//
//  Created by Vinícius Couto on 16/11/21.
//

@testable import TodoDrivenDevelopment
import XCTest

final class ContentViewModelTests: XCTestCase {
    // MARK: - System under test

    private let sut = ContentViewModel()

    func testAddShouldAppendNewTask() {
        // Given
        let task = Fixtures.Tasks.todo
        let expectedResult = [task]

        // When
        sut.add(task: task)

        // Then
        XCTAssertEqual(sut.todoList, expectedResult)
    }

    func testRemoveTaskShouldRemoveTaskFromList() {
        // Given
        let task = Fixtures.Tasks.todo
        let expectedResult = [TodoTask]()
        sut.add(task: task)

        // When
        sut.removeTask(id: task.id)

        // Then
        XCTAssertEqual(sut.todoList, expectedResult)
    }

    func testRemoveTaskShouldNotModifyListWhenIDDoesNotMatch() {
        // Given
        let task = Fixtures.Tasks.todo
        let expectedResult = [task]
        let id = UUID()
        sut.add(task: task)

        // When
        sut.removeTask(id: id)

        // Then
        XCTAssertEqual(sut.todoList, expectedResult)
    }

    func testToggleStatusShouldNotModifyListWhenIDDoesNotMatch() {
        // Given
        let task = Fixtures.Tasks.todo
        let expectedResult: TaskStatus = .todo
        let id = UUID()
        sut.add(task: task)

        // When
        sut.toggleStatus(id: id)

        // Then
        XCTAssertEqual(sut.todoList.first!.status, expectedResult)
    }

    func testToggleStatusShouldUpdateTodoStatus() {
        // Given
        let task = Fixtures.Tasks.todo
        let expectedResult: TaskStatus = .done
        sut.add(task: task)

        // When
        sut.toggleStatus(id: task.id)

        // Then
        XCTAssertEqual(sut.todoList.first!.status, expectedResult)
    }

    func testToggleStatusShouldUpdateDoneStatus() {
        // Given
        let task = Fixtures.Tasks.done
        let expectedResult: TaskStatus = .todo
        sut.add(task: task)

        // When
        sut.toggleStatus(id: task.id)

        // Then
        XCTAssertEqual(sut.todoList.first!.status, expectedResult)
    }

    func testUpdateTaskShouldNotModifyListWhenIDDoesNotMatch() {
        // Given
        let task = Fixtures.Tasks.todo
        let newName = Fixtures.Tasks.done.task
        let expectedResult = task.task
        let id = UUID()
        sut.add(task: task)

        // When
        sut.updateTask(id: id, with: newName)

        // Then
        XCTAssertEqual(sut.todoList.first!.task, expectedResult)
    }

    func testUpdateTaskShouldUpdateTaskName() {
        // Given
        let task = Fixtures.Tasks.todo
        let newName = Fixtures.Tasks.done.task
        let expectedResult = newName
        sut.add(task: task)

        // When
        sut.updateTask(id: task.id, with: newName)

        // Then
        XCTAssertEqual(sut.todoList.first!.task, expectedResult)
    }
}
