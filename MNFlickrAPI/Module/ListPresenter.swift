import UIKit

protocol ListPresenterDelegate: NSObjectProtocol {
    func encounterError(_ errorMessage: String)
    func succcess(itemsArray items: [ListItemModel])
}

public class ListPresenter: NSObject, ListInteractorDelegate {
    
    weak var delegate: ListPresenterDelegate?
    var interactor: ListInteractor?
    
    private override init() { }
    
    init(withDelegate delegate: ListPresenterDelegate) {
        self.delegate = delegate
    }

    public func loadFlickrImages() {
        guard let interactor = interactor else { return }
        interactor.loadFlickrAPIData()
    }

    func encounterError(_ errorMessage: String) {
        delegate?.encounterError(errorMessage)
    }
    
    func succcess(itemsArray items: [Item]) {
        let listItemModels = ListItemModel.listItemModels(fromItems: items)
        delegate?.succcess(itemsArray: listItemModels)
    }
}

public final class ListWithTagsPresenter: ListPresenter {
    
    public func loadFlickrImages(withTags tags: String) {
        guard let interactor = interactor as? ListWithTagsInteractor else { return }
        var tagsWithoutSpaces = tags.replacingOccurrences(of: " ", with: ",")
        tagsWithoutSpaces = tagsWithoutSpaces.replacingOccurrences(of: ".", with: ",")
        interactor.loadFlickrAPIData(withTags: tagsWithoutSpaces)
    }
}
