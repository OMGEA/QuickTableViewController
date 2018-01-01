//
//  ExampleUITests.swift
//  ExampleUITests
//
//  Created by Ben on 14/08/2017.
//  Copyright © 2017 bcylin.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest

internal final class ExampleUITests: XCTestCase {

  private lazy var app: XCUIApplication = XCUIApplication()

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app.launch()
  }

  func testInteractions() {
    let tablesQuery = XCUIApplication().tables

    tablesQuery.switches["Setting 1"].tap()
    XCTAssert(tablesQuery.staticTexts["Setting 1 = false"].exists)

    tablesQuery.switches["Setting 1"].tap()
    XCTAssert(tablesQuery.staticTexts["Setting 1 = true"].exists)

    tablesQuery.switches["Setting 2"].tap()
    XCTAssert(tablesQuery.staticTexts["Setting 2 = true"].exists)

    tablesQuery.switches["Setting 2"].tap()
    XCTAssert(tablesQuery.staticTexts["Setting 2 = false"].exists)

    tablesQuery.staticTexts["Tap action"].tap()
    addUIInterruptionMonitor(withDescription: "Action Triggered") {
      let button = $0.buttons["OK"]
      if button.exists {
        button.tap()
        return true
      }
      return false
    }

    tablesQuery.staticTexts[".value1"].tap()
    app.navigationBars.buttons.element(boundBy: 0).tap()
    XCTAssert(tablesQuery.staticTexts["CellStyle.value1 is selected"].exists)

    tablesQuery.staticTexts["Option 1"].tap()
    XCTAssert(tablesQuery.staticTexts["Option 1 is deselected"].exists)
    tablesQuery.staticTexts["Option 2"].tap()
    XCTAssert(tablesQuery.staticTexts["Option 2 is selected"].exists)
    tablesQuery.staticTexts["Option 3"].tap()
    XCTAssert(tablesQuery.staticTexts["Option 3 is selected"].exists)
  }

}
