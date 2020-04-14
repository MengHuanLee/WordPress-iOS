import UIKit

class PrepublishingNavigationController: LightNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the height for iPad
        if UIDevice.isPad() {
            view.heightAnchor.constraint(equalToConstant: Constants.iPadHeight).isActive = true
        }
    }

    private enum Constants {
        static let height: CGFloat = 290
        static let iPadHeight: CGFloat = 270
    }
}


// MARK: - DrawerPresentable

extension PrepublishingNavigationController: DrawerPresentable {
    var allowsUserTransition: Bool {
        return false
    }

    var expandedHeight: DrawerHeight {
        return .topMargin(20)
    }

    var collapsedHeight: DrawerHeight {
        return .contentHeight(Constants.height)
    }

    var scrollableView: UIScrollView? {
        let scroll = visibleViewController?.view as? UIScrollView

        return scroll
    }
}
