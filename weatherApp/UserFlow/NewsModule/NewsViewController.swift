import UIKit

class NewsViewController: UIViewController, ViewHolder, NewsModule {
  typealias RootViewType = NewsView

  var viewModel: NewsViewModel?
  var selectArticle: SelectArticle?
  
  override func loadView() {
    view = NewsView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    rootView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
    rootView.segment.addTarget(self, action: #selector(segmentChanged(segment:)), for: .valueChanged)
    viewModel = NewsViewModel(tableView: rootView.tableView, pageSize: 15)
    viewModel?.module = self
    viewModel?.start()
  }
  
  @objc func segmentChanged(segment: UISegmentedControl) {
    let type = NewsType(rawValue: segment.selectedSegmentIndex)
    viewModel?.start(type: type!)
  }
}
