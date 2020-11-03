import Alamofire
import Foundation

struct WebResourceManager {
  static let shared = WebResourceManager()
  static let networkLogLevel: NetworkLogger.NetworkLogLevel = .verbose
  
  func fetchRequest<A: Codable>(resource: ApiTarget, completion: @escaping (Result<A>)->Void) {
    let url = URL(string: resource.mainUrl)!
      .appendingPathComponent(resource.servicePath)
      .appendingPathComponent(resource.version.stringValue)
      .appendingPathComponent(resource.path)
    let header = resource.headers
    let parameter = resource.parameters
    let encoding: ParameterEncoding = resource.method == .get ? URLEncoding.queryString : JSONEncoding.default
    Alamofire.request(url, method: resource.method, parameters: parameter, encoding: encoding, headers: header).responseData { (response) in
      logger.response(
        code: response.response?.statusCode,
        path: response.response?.url?.absoluteString,
        data: response.data,
        logLevel: WebResourceManager.networkLogLevel)
      if let code = response.response?.statusCode {
        if 200...299 ~= code {
          logger.error("\(AppError.notReachable)", errorType: .decodingError)
          print("All well")
        }
        if 300...399 ~= code {
          print("Huhh")
        }
        if 400...499 ~= code {
          completion(.error(ApiResponseError.badServerResponse))
          return
        }
      }
      
      if let error = response.result.error {
        print(error)
        
        completion(.error(ApiResponseError.badServerResponse))
        return
      }
      if response.result.isSuccess {
        if let data = response.result.value {
          do {
            let baseData = try JSONDecoder().decode(A.self, from: data)
            completion(Result.value(baseData))
          }
          catch let jsonError {
            print(jsonError)
            completion(.error(ApiResponseError.badServerResponse))
          }
        }
      } else {
        completion(.error(ApiResponseError.badServerResponse))
        return
      }
    }
  }
}
