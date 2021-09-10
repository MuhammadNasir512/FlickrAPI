import XCTest
@testable import MNFlickrAPI

final class ListViewControllerTests: XCTestCase {
    
    func testExample() {
        
        let requestManagerMock = RequestsManagerMock()
        let fakeInteractorDelegate = ListInteractorDelegateMock()
        let interactorUnderTest = ListInteractor(withDelegate: fakeInteractorDelegate)
        interactorUnderTest.urlString = "https://google.com/"
        interactorUnderTest.requestManager = requestManagerMock

        let expect = expectation(description: "Expectation")
        requestManagerMock.expectation = expect
        interactorUnderTest.loadFlickrAPIData()
        
        waitForExpectations(timeout: 5) { error in
            let items = requestManagerMock.expectedItems
            XCTAssertEqual(items.count, 20)
        }
    }
}
