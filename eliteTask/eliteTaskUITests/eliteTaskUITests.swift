//
//  eliteTaskUITests.swift
//  eliteTaskUITests
//
//  Created by Allnet Systems on 7/15/24.
//

import XCTest

class eliteTaskUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExample() throws {
        // Test navigation to a specific screen or view controller
        let profileListNavigationBar = app.navigationBars["Profiles"]
        XCTAssertTrue(profileListNavigationBar.exists, "Profile list screen should be visible")

        // Test tapping on a table view cell (assuming your profiles are displayed in a table view)
        let profileCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(profileCell.waitForExistence(timeout: 5), "Profile cell should appear")
        profileCell.tap()

        // Example of verifying elements on a detail screen
        let nameLabel = app.staticTexts["profileNameLabel"]
        XCTAssertTrue(nameLabel.exists, "Profile name label should be visible")
        XCTAssertEqual(nameLabel.label, "John Doe", "Profile name should match expected value")

        // Example of tapping on a button and verifying a new screen
        let editButton = app.buttons["EditProfileButton"]
        XCTAssertTrue(editButton.exists, "Edit button should be visible")
        editButton.tap()

        let editScreenNavigationBar = app.navigationBars["Edit Profile"]
        XCTAssertTrue(editScreenNavigationBar.exists, "Edit profile screen should appear")
    }

    func testLaunchPerformance() throws {
        // Measure how long it takes to launch the application
        if #available(macOS 10.15, iOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                app.launch()
            }
        }
    }
}
