import XCTest
@testable import MNFlickrAPI

final class ExtensionsTests: XCTestCase {
    
    func testWhenDateIsProvidedInSpecificFormat_ThenItConvertsItToDesiredFormat() {
        
        var dateStringInput = "2017-12-24T23:53:37Z"
        var formattedDateString = dateStringInput.formattedDateString()

        XCTAssertNotNil(formattedDateString)
        var dateStringExpected = "25-12-2017"
        XCTAssertEqual(formattedDateString, dateStringExpected)
        
        dateStringInput = "2017-12-24T15:53:37-08:00"
        formattedDateString = dateStringInput.formattedDateString()
        dateStringExpected = "25-12-2017"
        XCTAssertEqual(formattedDateString, dateStringExpected)
    }
}
