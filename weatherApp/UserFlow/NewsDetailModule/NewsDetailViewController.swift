import UIKit

class NewsDetailViewController: UIViewController, ViewHolder, NewsDetailModule {
  typealias RootViewType = NewsDetailView
  
  private let article: Article
  private let cache = Cache<String, [Article]>()
  static let cacheName = "news"
  init(article: Article) {
    self.article = article
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = NewsDetailView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    rootView.setData(data: article)
    rootView.addButton.addTarget(self, action: #selector(addToFav), for: .touchUpInside)
    rootView.exitButton.addTarget(self, action: #selector(closeWindow), for: .touchUpInside)
  }
  
  @objc func closeWindow() {
    dismiss(animated: true, completion: nil)
  }

  @objc func addToFav() {
    var articles: [Article] = []
    articles.append(article)
    if var cacheArticles: [Article] = try? cache.readFromDisk(name: NewsDetailViewController.cacheName) {
      if !cacheArticles.contains(array: articles) {
        cacheArticles.append(article)
        saveToDisk(articles: cacheArticles)
      }
    } else {
      saveToDisk(articles: articles)
    }
  }
  
  func saveToDisk(articles: [Article]) {
    try? self.cache.saveToDisk(name: NewsDetailViewController.cacheName, value: articles)
  }
}
