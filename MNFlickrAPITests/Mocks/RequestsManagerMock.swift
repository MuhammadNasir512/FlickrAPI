import XCTest
@testable import MNFlickrAPI

final class RequestsManagerMock: RequestsManager {
    
    var loadDataCallCount = 0
    var expectation: XCTestExpectation?
    var expectedItems = [Item]()
    
    override func loadData() {
        loadDataCallCount += 1
        
        expectedItems = FixtureLoader.loadItemsFromFileNamed("FlickrFixture")

        if let successCallback = successCallback {
            successCallback(expectedItems)
            expectation?.fulfill()
        }
    }
}
