import UIKit

extension UIViewController {

  private enum AssociatedKeys {
    static var transitionManager = "transition_manager_key"
  }

  fileprivate var transitionManager: UIViewControllerTransitioningDelegate! {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.transitionManager) as? UIViewControllerTransitioningDelegate
    }
    set {
      objc_setAssociatedObject(self, &AssociatedKeys.transitionManager, newValue, .OBJC_ASSOCIATION_RETAIN)
    }
  }
}
