import Foundation

final class Timer {
  private let duration: Int
  public typealias MakeRequest = () -> Void
  private var makeRequest: MakeRequest?

  private var timer: DispatchSourceTimer?

  init(duration: Int) {
    self.duration = duration
  }
  
  func startTimer(completion: @escaping ()->Void) {
    let queue = DispatchQueue(label: "timer", attributes: .concurrent)
    timer?.cancel()
    timer = DispatchSource.makeTimerSource(queue: queue)
    timer?.schedule(deadline: .now(), repeating: .seconds(duration), leeway: .milliseconds(100))
    timer?.setEventHandler {
      completion()
    }
    timer?.resume()
  }
  
  func stopTimer() {
    timer?.cancel()
    timer = nil
  }
}
