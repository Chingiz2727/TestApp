import Alamofire

enum NewsTarget: ApiTarget {
  case getTopNews(page: Int, pageSize: Int)
  case getEverythingNews(page: Int, pageSize: Int)
  
  static let key = "e65ee0938a2a43ebb15923b48faed18d"
  
  var mainUrl: String { return "https://newsapi.org"}
  
  var version: ApiVersion {
    return .number(2)
  }
  
  var servicePath: String {
    return ""
  }
  
  var path: String { return "top-headlines" }
   
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
