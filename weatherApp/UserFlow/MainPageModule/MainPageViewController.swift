import UIKit

class MainPageViewController: UIViewController, MainPageModule, ViewHolder {
  typealias RootViewType = MainPageView
  static let cacheKey = "cache_city"
  private let cache = Cache<String, Weather>()

  override func loadView() {
    view = MainPageView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    rootView.segmentControl.addTarget(self, action: #selector(fetchData(segment:)), for: .valueChanged)
    fetchData(segment: rootView.segmentControl)
  }
  
  @objc private func fetchData(segment: UISegmentedControl) {
    let city = ["Almaty", "Astana"]
    let cacheName = MainPageViewController.cacheKey + city[segment.selectedSegmentIndex]
    if let weather: Weather = try? cache.readFromDisk(name: cacheName) {
      rootView.setData(data: weather)
    } else {
      Weather.fetchResource(city: city[segment.selectedSegmentIndex]) { [unowned self] weather in
        guard let value = weather.value else { return }
        self.cache[cacheName] = value
        try? self.cache.saveToDisk(name: cacheName, value: value)
        rootView.setData(data: value)
      }
    }
  }
}
