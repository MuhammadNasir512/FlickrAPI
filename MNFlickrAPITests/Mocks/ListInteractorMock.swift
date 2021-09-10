import UIKit
@testable import MNFlickrAPI

final class ListInteractorMock: ListInteractor {
    
    var loadFlickrAPIDataCallCount = 0
    var numberOfImagesToReturn = 0
    
    override func loadFlickrAPIData() {
        loadFlickrAPIDataCallCount += 1
        let itemsArray = fakeImagesArray()
        delegate?.succcess(itemsArray: itemsArray)
    }
    
    private func fakeImagesArray() -> [Item] {
        return FixtureLoader.loadItemsFromFileNamed("FlickrFixture")
    }
}
