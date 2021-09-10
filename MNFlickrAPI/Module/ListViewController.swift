import UIKit

public class ListViewController: UIViewController, ListPresenterDelegate {

    static let CellIdentifier = "ImageItemCell"
    
    var presenter: ListWithTagsPresenter?
    fileprivate var itemsArray: [ListItemModel]?
    
    @IBOutlet weak var tableView: UITableView?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        guard let tableView = tableView else { return }
        tableView.register(UINib(nibName: "ImageItemTableCell", bundle: nil), forCellReuseIdentifier: ListViewController.CellIdentifier)
        self.title = "Public Images"
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let presenter = presenter else { return }
        presenter.loadFlickrImages()
    }
    
    func encounterError(_ errorMessage: String) {
        AlertsManager.showErrorAlert(withMessage: errorMessage, inViewController: self)
    }
    
    func succcess(itemsArray items: [ListItemModel]) {
        guard let tableView = tableView else { return }
        itemsArray = items
        tableView.reloadData()
        tableView.setContentOffset(CGPoint.zero, animated: true)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.bounds.size.height / 2.5
        return height
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let imagesArray = itemsArray else { return 0 }
        return imagesArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellOptional = tableView.dequeueReusableCell(withIdentifier: ListViewController.CellIdentifier, for: indexPath) as? ImageItemTableCell
        guard let cell = cellOptional, let item = itemsArray?[indexPath.row] else { return UITableViewCell() }
        cell.reloadCell(withItem: item)
        return cell
    }
}

extension ListViewController: UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            presenter?.loadFlickrImages(withTags: text)
        }
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            presenter?.loadFlickrImages()
        }
    }
}
