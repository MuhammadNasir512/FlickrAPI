import Foundation

struct ListItemModel {
    
    let title: String
    let published: String
    let imageUrl: String

    init(item: Item) {
        title = item.title
        published = item.published.formattedDateString()
        imageUrl = item.imageUrl
    }
}

extension ListItemModel {
    
    static func listItemModels(fromItems items: [Item]) -> [ListItemModel] {
        return items.map { ListItemModel(item: $0) }
    }
}
