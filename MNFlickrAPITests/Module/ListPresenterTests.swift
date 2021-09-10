import XCTest
@testable import MNFlickrAPI

final class ListPresenterTests: XCTestCase {
    
    func testWhenLoadImagesMethodCalled_AndThereWereNoImages_ThenItReturnNoImages() {
        let fakeInteractorDelegate = ListInteractorDelegateMock()
        let interactorMock = ListInteractorMock(withDelegate: fakeInteractorDelegate)
        let fakePresenterDelegate = ListPresenterDelegateMock()
        let presenterUnderTest = ListPresenter(withDelegate: fakePresenterDelegate)
        
        let expectI = expectation(description: "ExpectationI")
        let expectP = expectation(description: "ExpectationP")
        fakeInteractorDelegate.expectation = expectI
        fakePresenterDelegate.expectation = expectP
        let result = XCTWaiter().wait(for: [expectI, expectP], timeout: 3, enforceOrder: true)
        
        presenterUnderTest.interactor = interactorMock
        presenterUnderTest.loadFlickrImages()

        if result == .completed {
            guard let result = fakePresenterDelegate.fakeItems else {
                XCTFail("Expected delegate to be called")
                return
            }
            XCTAssertTrue(result.count == 0)
            XCTAssertTrue(interactorMock.loadFlickrAPIDataCallCount == 1)
        }
    }
    
    func testWhenLoadImagesMethodCalled_AndThereWereSomeImages_ThenItReturnThoseImages() {
        let imagesToFake = 5
        let fakeInteractorDelegate = ListInteractorDelegateMock()
        let interactorMock = ListInteractorMock(withDelegate: fakeInteractorDelegate)
        interactorMock.numberOfImagesToReturn = imagesToFake
        let fakePresenterDelegate = ListPresenterDelegateMock()
        let presenterUnderTest = ListPresenter(withDelegate: fakePresenterDelegate)
        
        let expectI = expectation(description: "ExpectationI")
        let expectP = expectation(description: "ExpectationP")
        fakeInteractorDelegate.expectation = expectI
        fakePresenterDelegate.expectation = expectP
        let result = XCTWaiter().wait(for: [expectI, expectP], timeout: 3, enforceOrder: true)
        
        presenterUnderTest.interactor = interactorMock
        presenterUnderTest.loadFlickrImages()

        if result == .completed {
            guard let result = fakePresenterDelegate.fakeItems else {
                XCTFail("Expected delegate to be called")
                return
            }
            XCTAssertTrue(result.count == imagesToFake)
            XCTAssertTrue(interactorMock.loadFlickrAPIDataCallCount == 1)
        }
    }
}
