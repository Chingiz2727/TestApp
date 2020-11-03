import UIKit

class MainPageView: UIView {
  let segmentControl = UISegmentedControl(items: ["Almaty", "Nur-Sultan"])
  private let todayTitle = UILabel()
  private let scrollView = UIScrollView()
  private let celciLabel = UILabel()
  private let titleLabel = UILabel()
  private let maximumLabel = UILabel()
  private let imgView = UIImageView()
  private let currentDay = CurrentDayCardView()
  private let daysCountLabel = UILabel()
  private lazy var stackView = UIStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
    segmentControl.selectedSegmentIndex = 0
    configureView()
  }
  
  private func setupInitialLayout() {
    let viewStack = UIStackView(arrangedSubviews: [segmentControl , todayTitle ,currentDay, daysCountLabel, scrollView, UIView()])
    viewStack.axis = .vertical
    viewStack.spacing = 15
    addSubview(viewStack)
    viewStack.snp.makeConstraints { $0.edges.equalToSuperview().inset(25) }
    
    scrollView.addSubview(stackView)
    currentDay.snp.makeConstraints { make in
      make.height.equalTo(160)
    }
    segmentControl.snp.makeConstraints { $0.height.equalTo(38) }
    stackView.snp.makeConstraints { $0.edges.equalToSuperview().inset(16) }
    scrollView.snp.makeConstraints { make in
      make.height.equalTo(290)
    }
  }
  
  private func configureView() {
    scrollView.isScrollEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    daysCountLabel.font = .bold22
    stackView.spacing = 16
    backgroundColor = .white
    daysCountLabel.textColor = .black
    todayTitle.font = .bold22
    todayTitle.text = "Погода на сегодня"
  }
  
  func setData(data: Weather) {
    stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    currentDay.setData(current: data.current)
    daysCountLabel.text = "Погода на \(data.forecast.forecastday.count) дня"
    data.forecast.forecastday.forEach { data in
      let cardView = WeatherCardView()
      stackView.addArrangedSubview(cardView)
      cardView.setData(data: data)
    }
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
