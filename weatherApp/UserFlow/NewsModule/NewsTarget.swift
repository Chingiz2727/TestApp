import Alamofire

enum NewsTarget: ApiTarget {
  case getTopNews(page: Int, pageSize: Int)
  case getEverythingNews(page: Int, pageSize: Int)
  
  static let key = "a17b90eea4d64ffca4fd78b9d6a034e0"
  
  var mainUrl: String { return "https://newsapi.org"}
  
  var version: ApiVersion {
    return .number(2)
  }
  
  var servicePath: String {
    return ""
  }
  
  var path: String {
    switch self {
    case .getTopNews:
      return "top-headlines"
    case .getEverythingNews:
      return "everything"
    }
  }
   
  var method: HTTPMethod { return .get }
  
  var parameters: [String: Any]? {
    switch self {
    case .getTopNews(let page, let pageSize):
      return
        [
        "country": "us",
        "apiKey": NewsTarget.key,
        "pageSize": pageSize,
        "page": page
        ]
    case .getEverythingNews(let page, let pageSize):
      return
        [
        "q": "Apple",
        "apiKey": NewsTarget.key,
        "pageSize": pageSize,
        "page": page
        ]
    }
  }
}
