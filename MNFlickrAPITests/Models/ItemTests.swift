import XCTest
@testable import MNFlickrAPI

final class ItemTests: XCTestCase {
    
    func testWhenImageModelInitWithCorrectJSON_ThenItCreatedImageObjectCorrectly() {
        
        let items = FixtureLoader.loadItemsFromFileNamed("FlickrFixture")
        XCTAssertTrue(items.count > 0)
        let imageModelUnderTest = items[0]
        
        XCTAssertNotNil(imageModelUnderTest)
        XCTAssertEqual(imageModelUnderTest.title, "IMG_20171224_114126419")
        XCTAssertEqual(imageModelUnderTest.imageUrl, "https://farm5.staticflickr.com/4644/24409443907_d029fdd84b_m.jpg")
        
        let publishedDateInJsonObject = imageModelUnderTest.published
        XCTAssertEqual(publishedDateInJsonObject, "2017-12-24T23:53:23Z")
    }
}
