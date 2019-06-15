//
//     ____                 __   ___
//    / __/__ ___ _________/ /  / _ )___ _____
//   _\ \/ -_) _ `/ __/ __/ _ \/ _  / _ `/ __/
//  /___/\__/\_,_/_/  \__/_//_/____/\_,_/_/
//
//  Copyright © 2019 thang-nm. All rights reserved.
//

import UIKit

extension UIColor {

  static var accent = #colorLiteral(red: 0.2039215686, green: 0.2274509804, blue: 0.2509803922, alpha: 1)
  static var placeholder = #colorLiteral(red: 0.7568627451, green: 0.7647058824, blue: 0.7803921569, alpha: 1)
  static var border = #colorLiteral(red: 0.9254901961, green: 0.937254902, blue: 0.9529411765, alpha: 1)
}

extension UICollectionViewCell {

  static var identifier: String {
    return String(describing: self)
  }
}

extension UICollectionView {

  func reuse<T: UICollectionViewCell>(for indexPath: IndexPath) -> T? {
    return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
  }
}

extension UIView {

  func addChildView(_ child: UIView) {
    child.translatesAutoresizingMaskIntoConstraints = false
    addSubview(child)

    NSLayoutConstraint.activate([
      child.leadingAnchor.constraint(equalTo: leadingAnchor),
      child.trailingAnchor.constraint(equalTo: trailingAnchor),
      child.topAnchor.constraint(equalTo: topAnchor),
      child.bottomAnchor.constraint(equalTo: bottomAnchor)])
  }
}
