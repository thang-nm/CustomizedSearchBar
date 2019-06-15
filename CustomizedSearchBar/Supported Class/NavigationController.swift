//
//     ____                 __   ___
//    / __/__ ___ _________/ /  / _ )___ _____
//   _\ \/ -_) _ `/ __/ __/ _ \/ _  / _ `/ __/
//  /___/\__/\_,_/_/  \__/_//_/____/\_,_/_/
//
//  Copyright © 2019 thang-nm. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let attrs: [NSAttributedString.Key: Any] = [
      .foregroundColor: UIColor.accent
    ]
    navigationBar.prefersLargeTitles = true
    navigationBar.isTranslucent = false
    navigationBar.backgroundColor = .white
    navigationBar.tintColor = .accent
    navigationBar.titleTextAttributes = attrs
    navigationBar.largeTitleTextAttributes = attrs
    definesPresentationContext = true
  }
}
