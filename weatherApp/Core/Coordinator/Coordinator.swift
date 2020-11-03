public protocol Coordinator: AnyObject {
  var router: Routable { get }
  
  func start()
}
