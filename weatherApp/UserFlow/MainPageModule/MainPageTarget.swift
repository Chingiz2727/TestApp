import Alamofire

enum WeatherTarget: ApiTarget {
  case getweather(city: String)

  var mainUrl: String { return "https://api.weatherapi.com/" }
  
  var version: ApiVersion { return .number(1) }

  var path: String { return "forecast.json" }

  var servicePath: String { return "" }
  
  var method: HTTPMethod  { return .get }
  
  var parameters: [String : Any]? {
    switch self {
    case .getweather(let city):
      return ["key": key, "q": city, "lang": "ru", "days": "3"]
    }
  }
    
}
