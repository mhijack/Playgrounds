import UIKit
import XCTest

var str = "Hello, playground"


class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

class DefaultTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testJustTrue() {
        XCTAssertTrue(false)
    }
    
    
    
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
DefaultTests.defaultTestSuite.run()
