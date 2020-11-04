struct News: Codable {
  let status: String
  let totalResults: Int
  var articles: [Article]
}

extension News {
  static func fetchAllResource(page: Int, pageSize: Int ,completion: @escaping (Result<News>)->Void) {
    WebResourceManager.shared.fetchRequest(
      resource: NewsTarget.getTopNews(page: page, pageSize: pageSize), completion: completion)
  }
  
  static func fetchEverything(page: Int, pageSize: Int ,completion: @escaping (Result<News>)->Void) {
    WebResourceManager.shared.fetchRequest(
      resource: NewsTarget.getEverythingNews(page: page, pageSize: pageSize), completion: completion)
  }
}
