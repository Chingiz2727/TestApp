import UIKit

final class NewsViewModel: NSObject {
  
  private let tableView: UITableView
  private let cache = Cache<String, [Article]>()

  private var page: Int = 1
  private var pageSize: Int
  private var totalResults: Int = 0
  private var type: NewsType = .top
  private var timer: Timer?
  var module: NewsModule?
  
  var items: [Article] = [] {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  init(tableView: UITableView, pageSize: Int) {
    self.tableView = tableView
    self.pageSize = pageSize
    super.init()
    timer = Timer(duration: 5, makeRequest:  { [unowned self] in
      self.fetchAll()
    })
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func start(type: NewsType = .top) {
    page = 1
    totalResults = 0
    items.removeAll()
    self.type = type
    makeRequest()
  }
  
  private func fetchNew() {
    if items.count < totalResults {
      page = page + 1
      makeRequest()
    }
  }
  
  private func makeRequest() {
    switch type {
    case .everything:
      fetchEverything()
      timer?.stopTimer()
    case .top:
      timer?.startTimer()
    case.favourite:
      if let cacheArticles: [Article] = try? cache.readFromDisk(name: NewsDetailViewController.cacheName) {
        items = cacheArticles
      }
      timer?.stopTimer()
    }
  }
  
  private func fetchAll() {
    News.fetchAllResource(page: page, pageSize: pageSize) { [unowned self] (result) in
      if let value = result.value {
        totalResults = value.totalResults
        if !items.contains(array: result.value!.articles) {
          items.append(contentsOf: value.articles)
        }
      }
    }
  }
  
  private func fetchEverything() {
    News.fetchEverything(page: page, pageSize: pageSize) { [unowned self] (result) in
      if let value = result.value {
        totalResults = value.totalResults
        items.append(contentsOf: value.articles)
      }
    }
  }
}

extension NewsViewModel: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row + 1 == items.count {
      fetchNew()
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let article = items[indexPath.row]
    module?.selectArticle?(article)
  }
}

extension NewsViewModel: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "id")!
    let elements = items[indexPath.row]
    cell.textLabel?.text = elements.title
    return cell
  }
}
