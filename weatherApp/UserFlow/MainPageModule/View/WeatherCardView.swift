import UIKit
import SnapKit
import Kingfisher

class WeatherCardView: UIControl {
  private let titleLabel = UILabel()
  private let icon = UIImageView()
  private let celciLabel = UILabel()
  private let maxCelci = UILabel()
  private let minimumCelci = UILabel()
  
  private lazy var celciStack = UIStackView(arrangedSubviews: [maxCelci, minimumCelci])
  private lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, icon, celciLabel, celciStack])
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
    configureView()
    configureColor()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupInitialLayout() {
    addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(20)
      $0.width.equalTo(150)
      $0.leading.trailing.equalToSuperview().inset(10)
    }
  }
  
  private func configureView() {
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.spacing = 16
    
    celciStack.axis = .horizontal
    celciStack.distribution = .fillEqually
    celciStack.spacing = 16
    
    titleLabel.textAlignment = .center
    celciLabel.textAlignment = .center
    celciLabel.font = .bold20
    minimumCelci.font = .bold20
    maxCelci.font = .bold20
    titleLabel.font = .bold22
    titleLabel.numberOfLines = 0
    minimumCelci.textAlignment = .center
    maxCelci.textAlignment = .center
    icon.contentMode = .scaleAspectFit
    layer.cornerRadius = 8
  }
  
  private func configureColor() {
    backgroundColor = #colorLiteral(red: 0, green: 0.9336510897, blue: 0.711432755, alpha: 1)
    celciLabel.textColor = .white
    maxCelci.textColor = .white
    minimumCelci.textColor = .white
    titleLabel.textColor = .white
  }
  
  func setData(data: Forecastday) {
    celciLabel.text = "\(data.day.avgtemp_c)".celcium
    minimumCelci.text = "\(data.day.mintemp_c)".celcium
    maxCelci.text = "\(data.day.maxtemp_c)".celcium
    titleLabel.text = data.day.condition.text
    icon.kf.setImage(with: URL(string: "https:" + data.day.condition.icon))
  }
}
