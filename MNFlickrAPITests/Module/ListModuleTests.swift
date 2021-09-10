import XCTest
@testable import MNFlickrAPI

final class ListModuleTests: XCTestCase {
    
    func testWhenModuleObjectSetup_ThenItSetupDependenciesCorrectly() {
        let viewController = ListViewControllerMock()
        let module = ListModule(withViewController: viewController)
        XCTAssertEqual(module.viewController, viewController)
        
        let presenter = module.presenter!
        let interactor = module.interactor!
        XCTAssertEqual(presenter.interactor, interactor)
        XCTAssertNotNil(presenter.delegate)
        XCTAssertNotNil(interactor.delegate)
    }
}
