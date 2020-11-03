import UIKit
import Kingfisher

class CurrentDayCardView: UIView {
  private let weatherImg = UIImageView()
  private let temperatureLabel = UILabel()
  private let titleLabel = UILabel()
  private let maxTemperatureLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
    configureView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupInitialLayout() {
    let stackView = UIStackView(arrangedSubviews: [temperatureLabel, titleLabel, maxTemperatureLabel])
    stackView.axis = .vertical
    stackView.spacing = 10
    
    addSubview(stackView)
    addSubview(weatherImg)
    stackView.snp.makeConstraints { $0.edges.equalToSuperview().inset(16) }
    
    weatherImg.snp.makeConstraints { make in
      make.bottom.trailing.equalToSuperview()
    }
  }
  
  private func configureView() {
    temperatureLabel.font = .bold22
    titleLabel.font = .regular18
    maxTemperatureLabel.font = .regular17
    weatherImg.contentMode = .scaleAspectFit
    temperatureLabel.textAlignment = .center
    titleLabel.textAlignment = .center
    maxTemperatureLabel.textAlignment = .center
    temperatureLabel.numberOfLines = 0
    layer.cornerRadius = 8
    backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
  }
  
  func setData(current: Current) {
    maxTemperatureLabel.text = "\(current.temp_c)".celcium
    temperatureLabel.text = "Ощущается как \n\(current.feelslike_c)".celcium
    titleLabel.text = current.condition.text
    weatherImg.kf.setImage(with: URL(string: "https:" + current.condition.icon))
  }
}
