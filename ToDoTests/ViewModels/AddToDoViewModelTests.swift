//
//  AddToDoTests.swift
//  ToDoTests
//
//  Created by Arash Z. Jahangiri on 13.07.21.
//

import XCTest
@testable import ToDo
@testable import Apollo

class AddToDoViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateToSuccessful() throws {
        // Given
        APIManagerMock.shared.apolloClient = APolloMock.shared
        APIManagerMock.shared.successfulResult = true
        let viewModel = AddToDoViewModel()
        viewModel.apiManager = APIManagerMock.shared
        
        // When
        viewModel.createToDo(title: "to do 1", description: "this is for unit testing")
        
        // Then
        XCTAssertTrue(APIManagerMock.shared.requestWasCalled)
        XCTAssertTrue(viewModel.toDoCreated)
    }
    
    func testCreateToFailed() throws {
        // Given
        APIManagerMock.shared.apolloClient = APolloMock.shared
        APIManagerMock.shared.successfulResult = false
        let viewModel = AddToDoViewModel()
        viewModel.apiManager = APIManagerMock.shared
        
        // When
        viewModel.createToDo(title: "to do 1", description: "this is for unit testing")
        
        // Then
        XCTAssertTrue(APIManagerMock.shared.requestWasCalled)
        XCTAssertFalse(viewModel.toDoCreated)
    }

}
