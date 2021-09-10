import UIKit

protocol ListInteractorDelegate: NSObjectProtocol {
    func encounterError(_ errorMessage: String)
    func succcess(itemsArray items: [Item])
}

let APIURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"

public class ListInteractor: NSObject {
    
    weak var delegate: ListInteractorDelegate?
    var requestManager = RequestsManager()
    var urlString = APIURL

    private override init() { }
    
    init(withDelegate delegate: ListInteractorDelegate?) {
        self.delegate = delegate
    }
    
    public func loadFlickrAPIData() {
        
        requestManager.urlString = urlString
        requestManager.successCallback = { [weak self] (items: [Item]) in
            guard let self = self else { return }
            self.urlString = APIURL
            self.delegate?.succcess(itemsArray: items)
        }
        requestManager.failCallback = { [weak self] (error: Error?, response: URLResponse?) in
            guard let self = self else { return }
            self.urlString = APIURL
            let errorMessage = error?.localizedDescription ?? "Unknown Error"
            self.delegate?.encounterError(errorMessage)
        }
        requestManager.loadData()
    }
}

public final class ListWithTagsInteractor: ListInteractor {
    public func loadFlickrAPIData(withTags tags: String) {
        urlString = "\(urlString)&tags=\(tags)"
        super.loadFlickrAPIData()
    }
}
