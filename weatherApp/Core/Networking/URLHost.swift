enum URLHost: String {
  case live = "jsonplaceholder.typicode.com"
  
  var host: String {
    return self.rawValue
  }
  
  var fixedPath: String {
    return ""
  }
}
