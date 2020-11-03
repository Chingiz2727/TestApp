import UIKit

public extension UIFont {

  // MARK: bold
  static var bold17: UIFont { boldFont(17) }
  static var bold20: UIFont { boldFont(20) }
  static var bold22: UIFont { boldFont(22) }
  static var bold27: UIFont { boldFont(27) }
  static var bold28: UIFont { boldFont(28) }
  static var bold33: UIFont { boldFont(33) }

  // MARK: semibold

  static var semibold12: UIFont { semiboldFont(12) }
  static var semibold13: UIFont { semiboldFont(13) }
  static var semibold15: UIFont { semiboldFont(15) }
  static var semibold17: UIFont { semiboldFont(17) }
  static var semibold20: UIFont { semiboldFont(20) }
  static var semibold27: UIFont { semiboldFont(27) }
  static var semibold33: UIFont { semiboldFont(33) }

  // MARK: medium

  static var medium10: UIFont { mediumFont(10) }
  static var medium12: UIFont { mediumFont(12) }
  static var medium13: UIFont { mediumFont(13) }
  static var medium15: UIFont { mediumFont(15) }
  static var medium17: UIFont { mediumFont(17) }

  // MARK: regular

  static var regular10: UIFont { regularFont(10) }
  static var regular12: UIFont { regularFont(12) }
  static var regular13: UIFont { regularFont(13) }
  static var regular15: UIFont { regularFont(15) }
  static var regular17: UIFont { regularFont(17) }
  static var regular18: UIFont { regularFont(18) }
  static var regular36: UIFont { regularFont(36) }

  // MARK: - helper methods

  private static func regularFont(_ size: CGFloat) -> UIFont {
    .systemFont(ofSize: size, weight: .regular)
  }

  private static func mediumFont(_ size: CGFloat) -> UIFont {
    .systemFont(ofSize: size, weight: .medium)
  }

  private static func semiboldFont(_ size: CGFloat) -> UIFont {
    .systemFont(ofSize: size, weight: .semibold)
  }

  private static func boldFont(_ size: CGFloat) -> UIFont {
    .boldSystemFont(ofSize: size)
  }
}
