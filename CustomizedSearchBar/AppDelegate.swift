//
//     ____                 __   ___
//    / __/__ ___ _________/ /  / _ )___ _____
//   _\ \/ -_) _ `/ __/ __/ _ \/ _  / _ `/ __/
//  /___/\__/\_,_/_/  \__/_//_/____/\_,_/_/
//
//  Copyright © 2019 thang-nm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
  {
    let layout = CHTCollectionViewWaterfallLayout()
    let screen = PhotosViewController(collectionViewLayout: layout)
    let navigator = NavigationController(rootViewController: screen)
    layout.minimumColumnSpacing = 18
    layout.minimumInteritemSpacing = 18

    window = .init(frame: UIScreen.main.bounds)
    window?.rootViewController = navigator
    window?.makeKeyAndVisible()
    return true
  }
}
