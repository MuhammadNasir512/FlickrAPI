import UIKit
import SDWebImage

final class ImageItemTableCell: UITableViewCell {
    
    @IBOutlet weak var imageViewItem: UIImageView?
    @IBOutlet weak var dateLabel: UILabel?
    private var item: Item?
    
    func reloadCell(withItem item: ListItemModel) {
        guard let imageViewItem = imageViewItem else { return }
        dateLabel?.text = item.published
        let url = item.imageUrl
        imageViewItem.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: ""))
    }
}
