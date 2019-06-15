//
//     ____                 __   ___
//    / __/__ ___ _________/ /  / _ )___ _____
//   _\ \/ -_) _ `/ __/ __/ _ \/ _  / _ `/ __/
//  /___/\__/\_,_/_/  \__/_//_/____/\_,_/_/
//
//  Copyright © 2019 thang-nm. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

  weak var wrapper: UIView!
  weak var imageView: UIImageView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initView()
  }

  func initView() {
    let wrapper = UIView(frame: .zero)
    let imageView = UIImageView(frame: .zero)

    wrapper.layer.cornerRadius = 4
    imageView.layer.cornerRadius = wrapper.layer.cornerRadius
    imageView.clipsToBounds = true
    backgroundColor = .white
    contentView.backgroundColor = .white

    addChildView(wrapper)
    wrapper.addChildView(imageView)

    self.wrapper = wrapper
    self.imageView = imageView
  }
}
