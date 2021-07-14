//
//  ToDoUITests.swift
//  ToDoUITests
//
//  Created by Arash Z. Jahangiri on 10.07.21.
//

import XCTest

class ToDoUITests: XCTestCase {
    
    let app = XCUIApplication()
    struct Constants {
        static let newToDo = "New ToDo"
        static let newToDoNavBarTitle = "New To-Do"
        static let addButton = "Add"
        static let nameTextField = "To-Do's Name"
        static let notesTextField = "Description"
        static let dismissButton = "Dismiss"
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTodoListViewAppearance() throws {
        // UI tests must launch the application that they test.
        
        let texts = app.staticTexts
        XCTAssertEqual(texts.count, 1)
    }
    
    func testAddButtonExists() throws {
        // UI tests must launch the application that they test.
        
        let buttons = app.buttons
        let addButton = app.buttons["\(Constants.newToDo)"]
        XCTAssertEqual(buttons.count, 1)
        XCTAssert(addButton.exists)
        XCTAssertEqual(addButton.label, "\(Constants.newToDo)")
    }
}
