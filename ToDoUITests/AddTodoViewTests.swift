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

    func testAddTodoViewAppearance() {
        app.buttons["\(Constants.newToDo)"].tap()
        let addTodoNavBarTitle = app.staticTexts["\(Constants.newToDoNavBarTitle)"]
        XCTAssert(addTodoNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func testAddTodoView() {
        // present AddToDoView
        app.buttons["\(Constants.newToDo)"].tap()
        
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)
        
        let nameTextField = app.textFields["\(Constants.nameTextField)"]
        XCTAssert(nameTextField.exists)
        
        let notesTextField = app.textFields["\(Constants.notesTextField)"]
        XCTAssert(notesTextField.exists)
        
        let addButton = app.buttons["\(Constants.addButton)"]
        XCTAssert(addButton.exists)
        XCTAssertEqual(addButton.label, "\(Constants.addButton)")
        
        let dismissButton = app.buttons["\(Constants.dismissButton)"]
        XCTAssert(dismissButton.exists)
    }
    
    func testAddTodoDismissButton() {
        // present AddToDoView
        app.buttons["\(Constants.newToDo)"].tap()
        
        let dismissButton = app.buttons["\(Constants.dismissButton)"]
        dismissButton.tap()
        XCTAssertFalse(dismissButton.waitForExistence(timeout: 0.5))
    }
    
    func testAddButtonWithFilledNameTextField() {
        // present AddToDoView
        app.buttons["\(Constants.newToDo)"].tap()
        
        let nameTextField = app.textFields["\(Constants.nameTextField)"]
        nameTextField.tap()
        nameTextField.typeText("title for my To Do")
        XCTAssertNotEqual(nameTextField.value as! String, "")
        
        // test AddToDoView dismissed
        let dismissButton = app.buttons["\(Constants.dismissButton)"]
        dismissButton.tap()
        XCTAssertFalse(dismissButton.waitForExistence(timeout: 0.5))
        
        // test ToDoListView appeared
        let buttons = app.buttons
        let addButton = app.buttons["\(Constants.newToDo)"]
        XCTAssertEqual(buttons.count, 1)
        XCTAssert(addButton.exists)
        XCTAssertEqual(addButton.label, "\(Constants.newToDo)")
    }
    
    func testAddButtonWithEmptyNameTextField() {
        // present AddToDoView
        app.buttons["\(Constants.newToDo)"].tap()
        
        let nameTextField = app.textFields["\(Constants.nameTextField)"]
        nameTextField.tap()
        nameTextField.typeText(String(XCUIKeyboardKey.delete.rawValue))
        
        let addButton = app.buttons["\(Constants.addButton)"]
        addButton.tap()
        
        // test staying on AddToDoView
        let dismissButton = app.buttons["\(Constants.dismissButton)"]
        dismissButton.tap()
        XCTAssertTrue(dismissButton.waitForExistence(timeout: 0.5))
    }
    
}
