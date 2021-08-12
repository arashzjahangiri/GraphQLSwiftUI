//
//  ToDoViewModelTests.swift
//  ToDoViewModelTests
//
//  Created by Arash Z. Jahangiri on 10.07.21.
//

import XCTest
@testable import ToDo

class ToDoViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetToDoListSuccessful() throws {
        // Given
        APIManagerMock.shared.apolloClient = APolloMock.shared
        APIManagerMock.shared.successfulResult = true
        let viewModel = ToDoViewModel(apiManager: APIManagerMock.shared)
        
        // When
        viewModel.getToDoList()
        
        // Then
        XCTAssertTrue(APIManagerMock.shared.requestWasCalled)
        XCTAssertTrue(viewModel.toDoList.count == 2)
        XCTAssertNotNil(viewModel.toDoList[0])
        XCTAssertNotNil(viewModel.toDoList[1])
        XCTAssertEqual(viewModel.toDoList[0].title, "todo 1")
        XCTAssertEqual(viewModel.toDoList[1].title, "todo 2")
        XCTAssertEqual(viewModel.toDoList[0].description, "todo 1 notes")
        XCTAssertEqual(viewModel.toDoList[1].description, "todo 2 notes")
        XCTAssertFalse(viewModel.toDoList[0].status ?? false)
        XCTAssertTrue(viewModel.toDoList[1].status ?? false)
    }
    
    func testGetToDoListWhenListIsNotEmpty() throws {
        // Given
        APIManagerMock.shared.apolloClient = APolloMock.shared
        APIManagerMock.shared.successfulResult = true
        let viewModel = ToDoViewModel(apiManager: APIManagerMock.shared)
        viewModel.getToDoList()
        
        // When
        viewModel.getToDoList()
        
        // Then
        XCTAssertTrue(APIManagerMock.shared.requestWasCalled)
        XCTAssertTrue(viewModel.toDoList.count == 2)
        XCTAssertNotNil(viewModel.toDoList[0])
        XCTAssertNotNil(viewModel.toDoList[1])
        XCTAssertEqual(viewModel.toDoList[0].id, 1)
        XCTAssertEqual(viewModel.toDoList[1].id, 2)
        XCTAssertEqual(viewModel.toDoList[0].title, "todo 1")
        XCTAssertEqual(viewModel.toDoList[1].title, "todo 2")
        XCTAssertEqual(viewModel.toDoList[0].description, "todo 1 notes")
        XCTAssertEqual(viewModel.toDoList[1].description, "todo 2 notes")
        XCTAssertFalse(viewModel.toDoList[0].status ?? false)
        XCTAssertTrue(viewModel.toDoList[1].status ?? false)
    }
    
    func testGetToDoListFailed() throws {
        // Given
        APIManagerMock.shared.apolloClient = APolloMock.shared
        APIManagerMock.shared.successfulResult = false
        let viewModel = ToDoViewModel(apiManager: APIManagerMock.shared)
        
        // When
        viewModel.getToDoList()
        
        // Then
        XCTAssertTrue(APIManagerMock.shared.requestWasCalled)
        XCTAssertTrue(viewModel.toDoList.count == 0)
    }
    
    func testUpdateItem() throws {
        // Given
        APIManagerMock.shared.apolloClient = APolloMock.shared
        APIManagerMock.shared.successfulResult = true
        let viewModel = ToDoViewModel(apiManager: APIManagerMock.shared)
        viewModel.getToDoList()
        
        // When
        viewModel.updateItem(id: 1)
        
        // Then
        XCTAssertTrue(APIManagerMock.shared.requestWasCalled)
        XCTAssertTrue(viewModel.toDoList.count == 2)
        XCTAssertEqual(viewModel.toDoList[0].id, 1)
        XCTAssertEqual(viewModel.toDoList[0].title, "todo 1")
        XCTAssertEqual(viewModel.toDoList[0].description, "todo 1 notes")
        XCTAssertTrue(viewModel.toDoList[0].status ?? false)
    }
    
    func testUpdateItemWithNilStatus() throws {
        // Given
        APIManagerMock.shared.apolloClient = APolloMock.shared
        APIManagerMock.shared.successfulResult = true
        let viewModel = ToDoViewModel(apiManager: APIManagerMock.shared)
        viewModel.getToDoList()
        viewModel.toDoList[0].status = nil
        // When
        viewModel.updateItem(id: 1)
        
        // Then
        XCTAssertTrue(APIManagerMock.shared.requestWasCalled)
        XCTAssertTrue(viewModel.toDoList.count == 2)
        XCTAssertEqual(viewModel.toDoList[0].id, 1)
        XCTAssertEqual(viewModel.toDoList[0].title, "todo 1")
        XCTAssertEqual(viewModel.toDoList[0].description, "todo 1 notes")
        XCTAssertTrue(viewModel.toDoList[0].status ?? false)
    }
    
    func testUpdateItemWithRollback() throws {
        // Given
        APIManagerMock.shared.apolloClient = APolloMock.shared
        APIManagerMock.shared.successfulResult = true
        let viewModel = ToDoViewModel(apiManager: APIManagerMock.shared)
        // get list
        viewModel.getToDoList()
        
        // When
        APIManagerMock.shared.successfulResult = false
        viewModel.updateItem(id: 1)
        
        // Then
        XCTAssertTrue(APIManagerMock.shared.requestWasCalled)
        XCTAssertTrue(viewModel.toDoList.count == 2)
        XCTAssertEqual(viewModel.toDoList[0].id, 1)
        XCTAssertEqual(viewModel.toDoList[0].title, "todo 1")
        XCTAssertEqual(viewModel.toDoList[0].description, "todo 1 notes")
        XCTAssertFalse(viewModel.toDoList[0].status ?? false)
    }
    
}
