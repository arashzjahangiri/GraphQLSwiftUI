//
//  AddTodoViewTests.swift
//  ToDoUITests
//
//  Created by Arash Z. Jahangiri on 14.07.21.
//

import XCTest

class AddTodoViewTests: XCTestCase {

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

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app.launch()
    }

    func testAddTodoViewAppearance() throws {
        app.buttons["\(Constants.newToDo)"].tap()
        let addTodoNavBarTitle = app.staticTexts["\(Constants.newToDoNavBarTitle)"]
        XCTAssert(addTodoNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func testAddTodoView() throws {
        app.buttons["\(Constants.newToDo)"].tap()
     
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)
     
        let name = app.textFields["\(Constants.nameTextField)"]
        XCTAssert(name.exists)
     
        let notes = app.textFields["\(Constants.notesTextField)"]
        XCTAssert(notes.exists)
     
        let add = app.buttons["\(Constants.addButton)"]
        XCTAssert(add.exists)
        XCTAssertEqual(add.label, "\(Constants.addButton)")
     
        let dismiss = app.buttons["\(Constants.dismissButton)"]
        XCTAssert(dismiss.exists)
    }
    
    func testAddTodoDismissButton() throws {
        app.buttons["\(Constants.newToDo)"].tap()
        
        let dismiss = app.buttons["\(Constants.dismissButton)"]
        dismiss.tap()
        XCTAssertFalse(dismiss.waitForExistence(timeout: 0.5))
    }

}
