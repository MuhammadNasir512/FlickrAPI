import UIKit

final class ListModule: NSObject {
    
    var viewController: ListViewController?
    var presenter: ListWithTagsPresenter?
    var interactor: ListWithTagsInteractor?
    
    private override init() { }
    
    init(withViewController viewController: ListViewController) {
        self.viewController = viewController
        super.init()
        setupHomeScreenModule(withViewController: viewController)
    }
    
    private func setupHomeScreenModule(withViewController viewController: ListViewController) {
        let presenter = ListWithTagsPresenter(withDelegate: viewController)
        let interactor = ListWithTagsInteractor(withDelegate: presenter)
        viewController.presenter = presenter
        presenter.interactor = interactor
        interactor.delegate = presenter
        self.presenter = presenter
        self.interactor = interactor
    }
}
