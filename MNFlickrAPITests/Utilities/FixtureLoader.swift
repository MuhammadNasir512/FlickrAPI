import Foundation
@testable import MNFlickrAPI

final class FixtureLoader: NSObject {
    
    class func loadItemsFromFileNamed(_ fileName : String) -> [Item] {
        
        if let path = Bundle(for: FixtureLoader.self).path(forResource: fileName, ofType: "json") {
            do { let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                guard let result = try? JSONDecoder().decode(RootObject.self, from: data) else { return [] }
                return result.items
            } catch {
                return []
            }
        }
        return []
    }
}
