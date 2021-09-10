import UIKit
import XCTest
@testable import MNFlickrAPI

final class ListPresenterDelegateMock: NSObject, ListPresenterDelegate {
    var fakeItems: [ListItemModel]?
    var expectation: XCTestExpectation?
    func encounterError(_ errorMessage: String) { }
    
    func succcess(itemsArray items: [ListItemModel]) {
        fakeItems = items
        expectation?.fulfill()
    }
}
