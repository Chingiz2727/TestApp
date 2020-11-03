import Foundation
import Alamofire
struct Weather: Codable {
  let location: Location
  let current: Current
  let forecast: Forecast
}

extension Weather {
  static func fetchResource(city: String,completion: @escaping (Result<Weather>)->Void) {
    WebResourceManager.shared.fetchRequest(resource: WeatherTarget.getweather(city: city), completion: completion)
  }
}
