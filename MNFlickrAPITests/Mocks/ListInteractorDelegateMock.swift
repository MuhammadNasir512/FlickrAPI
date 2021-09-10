import XCTest
@testable import MNFlickrAPI

final class ListInteractorDelegateMock: NSObject, ListInteractorDelegate {
    
    var fakeItems: [Item]?
    var expectation: XCTestExpectation?
    func encounterError(_ errorMessage: String) { }
    
    func succcess(itemsArray items: [Item]) {
        fakeItems = items
        expectation?.fulfill()
    }
}
