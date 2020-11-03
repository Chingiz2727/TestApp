import Foundation
import Alamofire

class RequestToken {
  private weak var task: URLSessionTask?
  
  init(task: URLSessionTask?) {
    self.task = task
  }
  
  func cancel() {
    self.task?.cancel()
  }
}
