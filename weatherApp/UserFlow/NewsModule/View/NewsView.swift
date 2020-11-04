import UIKit

class NewsView: UIView {
  let tableView = UITableView()
  let segment = UISegmentedControl(items: ["Top Head","Everything", "Favourites"])
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
    configureView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupInitialLayout() {
    let stack = UIStackView(arrangedSubviews: [segment,tableView])
    stack.spacing = 5
    stack.axis = .vertical

    addSubview(stack)

    stack.snp.makeConstraints { make in
      make.leading.bottom.trailing.equalToSuperview()
      make.top.equalTo(safeAreaLayoutGuide)
    }

    segment.snp.makeConstraints { $0.height.equalTo(33) }
    segment.selectedSegmentIndex = 0
  }
  
  private func configureView() {
    backgroundColor = .white
  }
}
