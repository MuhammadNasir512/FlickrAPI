import UIKit

struct RootObject: Codable {
    let items: [Item]
}

struct Item: Codable {
    let title: String
    let published: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title, published, media
    }

    enum ImageUrlKeys: String, CodingKey {
        case imageUrl =  "m"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        published = try container.decode(String.self, forKey: .published)
        let media = try container.nestedContainer(keyedBy: ImageUrlKeys.self, forKey: .media)
        imageUrl = try media.decode(String.self, forKey: .imageUrl)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(published, forKey: .published)
        var media = container.nestedContainer(keyedBy: ImageUrlKeys.self, forKey: .media)
        try media.encode(imageUrl, forKey: .imageUrl)
    }
}
