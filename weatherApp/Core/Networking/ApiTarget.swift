import Foundation
import Alamofire

protocol ApiTarget {
  var mainUrl: String { get }
  var version: ApiVersion { get }
  var servicePath: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: [String: Any]? { get }
  var headers: [String: String]? { get }
}

public enum ApiVersion {

  case number(Int)
  case custom(String)

  public var stringValue: String {
    switch self {
    case .number(let value):
      return "v\(value)"
    case .custom(let value):
      return value
    }
  }
}

extension ApiTarget {

  var defaultHeaders: [String: String] {
    var headers =  [String: String]()
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "application/json"
    return headers
  }

  var headers: [String: String]? {
    return defaultHeaders
  }
}

public enum ApiResponseError: LocalizedError {

  case badServerResponse

  public var errorDescription: String? {
    switch self {
    case .badServerResponse:
      return "error_bad_server_response"
    }
  }
}
