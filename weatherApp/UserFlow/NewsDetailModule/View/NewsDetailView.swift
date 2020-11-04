import UIKit
import Kingfisher

class NewsDetailView: UIView {
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let img = UIImageView()
  let addButton = UIButton()
  let exitButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
    configureView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupInitialLayout() {
    let buttonStack = UIStackView(arrangedSubviews: [exitButton, addButton])
    let stack = UIStackView(arrangedSubviews: [buttonStack, img, titleLabel, descriptionLabel, UIView()])
    addSubview(stack)
    
    stack.axis = .vertical
    stack.spacing = 10
  
    stack.snp.makeConstraints { $0.edges.equalToSuperview().inset(20) }
    
    img.snp.makeConstraints { $0.height.equalTo(300) }
    
    addButton.snp.makeConstraints {
      $0.height.equalTo(33)
    }
    
    exitButton.snp.makeConstraints {
      $0.height.equalTo(33)
    }
  }
  
  private func configureView() {
    titleLabel.font = .bold22
    descriptionLabel.font = .regular18
    titleLabel.textColor = .black
    descriptionLabel.textColor = .black
    img.contentMode = .scaleAspectFit
    titleLabel.numberOfLines = 0
    descriptionLabel.numberOfLines = 0
    backgroundColor = .white
    addButton.setTitle("Добавить в избранные", for: .normal)
    exitButton.setTitle("Закрыть", for: .normal)
    exitButton.setTitleColor(.black, for: .normal)
    addButton.setTitleColor(.black, for: .normal)
  }

  func setData(data: Article) {
    titleLabel.text = data.title
    descriptionLabel.text = data.description
    guard let url = data.urlToImage else { return }
    img.kf.setImage(with: URL(string: url))
  }
}
