import UIKit

typealias RequestsManagerSuccessCallback = (_ items: [Item]) -> Void
typealias RequestsManagerFailCallback = (_ error: Error?, _ response: URLResponse?) -> Void

class RequestsManager: NSObject {
    
    var successCallback: RequestsManagerSuccessCallback?
    var failCallback: RequestsManagerFailCallback?
    var urlString: String?
    
    public func loadData() {
        
        guard let urLString = urlString, let url = URL(string:urLString) else { return }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: request as URLRequest) { [weak self] (data, response, error) in
            
            DispatchQueue.main.async {
                if let data = data {
                    guard let result = try? JSONDecoder().decode(RootObject.self, from: data) else {
                        let error = NSError(domain: "Parsing", code: 901, userInfo: nil)
                        self?.failCallback?(error, response)
                        return
                    }
                    self?.successCallback?(result.items)
                }
                else {
                    self?.failCallback?(error, response)
                }
            }
        }
        dataTask.resume()
    }
}
