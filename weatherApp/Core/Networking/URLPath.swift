import Foundation

enum URLPath {
  case user
  case logout(id: Int)
  case update(userId: Int)
  
  var path: String {
    switch self {
    case .user:
      return "/users"
    case let .logout(id: userId):
      return "/users/\(userId)/logout"
    case let .update(userId: userId):
      return "/users/\(userId)/update"
    }
  }
  
  var url: URL? {
    var urlComponent = URLComponents()
    urlComponent.scheme = AppConfig.scheme
    urlComponent.host = AppConfig.host.rawValue
    urlComponent.path = AppConfig.host.fixedPath + self.path
    return urlComponent.url
  }
}
