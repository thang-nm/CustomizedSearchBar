//
//     ____                 __   ___
//    / __/__ ___ _________/ /  / _ )___ _____
//   _\ \/ -_) _ `/ __/ __/ _ \/ _  / _ `/ __/
//  /___/\__/\_,_/_/  \__/_//_/____/\_,_/_/
//
//  Copyright © 2019 thang-nm. All rights reserved.
//

import UIKit

class PhotosViewController: UICollectionViewController {

  var searchController: UISearchController!
  var photos: [String] = Array(1...12).map {"photo_\($0)"}

  override func viewDidLoad() {
    super.viewDidLoad()
    initView()
    initSearchController()
    initCollectionView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationItem.hidesSearchBarWhenScrolling = true
  }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    removeNavBarBorder(searchController.searchBar)
  }
}

// MARK: - Init views
extension PhotosViewController {

  private func initView() {
    title = "Photos"
    view.backgroundColor = .white
    definesPresentationContext = true
    extendedLayoutIncludesOpaqueBars = true

    let image = UIImage(named: "button_menu")
    let menu = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
    navigationItem.leftBarButtonItem = menu
  }

  private func initSearchController() {
    searchController = UISearchController(searchResultsController: nil)
    searchController.definesPresentationContext = true
    searchController.dimsBackgroundDuringPresentation = true
    searchController.searchBar.tintColor = .accent
    searchController.searchBar.backgroundColor = .white
    restyleSearchBar(searchController.searchBar)

    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
  }

  private func initCollectionView() {
    collectionView.backgroundColor = .white
    collectionView.contentInset = .init(top: 0, left: 18, bottom: 18, right: 18)
    collectionView.register(
      PhotoCollectionViewCell.self,
      forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
  }
}

// MARK: - Restyle search bar
extension PhotosViewController {

  /// Remove navigation bar bottom border.
  /// If you use navigationBar.setBackgroundImage,
  /// UISearchBar will be broken when presented
  private func removeNavBarBorder(_ searchBar: UISearchBar) {
    guard let parent = searchBar.superview else { return }
    parent.subviews.forEach { v in
      v.subviews.filter { $0 is UIImageView }
        .forEach { $0.removeFromSuperview() }
    }
  }

  /// Make your own search bar
  private func restyleSearchBar(_ view: UIView) {
    view.subviews.forEach {
      let clazz = String(describing: type(of: $0))
      switch clazz {
      case "UISearchBarTextField":
        // Do whatever you want with search bar textfield
        guard let textField = $0 as? UITextField else { break }
        restyleSearchBarTextField(textField)

      case "UISearchBarBackground",
           "_UISearchBarSearchFieldBackgroundView":
        // Do whatever you want with gray background
        $0.alpha = 0
        $0.isHidden = true
        $0.layer.opacity = 0

      default: break
      }

      // Continue loop with subview
      restyleSearchBar($0)
    }
  }

  private func restyleSearchBarTextField(_ textField: UITextField) {
    // Update place holder
    let placehodler = NSMutableAttributedString(
      string: "Search photos..",
      attributes: [
        .font: UIFont.systemFont(ofSize: 16),
        .foregroundColor: UIColor.placeholder])

    // Update left search icon
    // You can use searchController.searchBar.setImage
    // but it can't change icon frame
    let icon = #imageLiteral(resourceName: "icon_search")
    let searchIcon = UIImageView(image: icon)
    searchIcon.frame = CGRect(origin: .zero, size: icon.size)

    // You should use main queue
    DispatchQueue.main.async {
      textField.attributedPlaceholder = placehodler
      textField.textColor = .accent
      textField.tintColor = .accent
      textField.layer.cornerRadius = 18
      textField.layer.borderColor = UIColor.border.cgColor
      textField.layer.borderWidth = 1
      textField.leftView = searchIcon
    }
  }
}

// MARK: - UICollectionViewDataSource
extension PhotosViewController {

  override func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int
  {
    return photos.count
  }

  override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
  {
    guard let cell: PhotoCollectionViewCell = collectionView.reuse(for: indexPath) else {
      fatalError("Can't reuse cell")
    }

    let image = UIImage(named: photos[indexPath.row])
    cell.backgroundColor = .gray
    cell.imageView.image = image
    return cell
  }
}

// MARK: - CHTCollectionViewDelegateWaterfallLayout
extension PhotosViewController: CHTCollectionViewDelegateWaterfallLayout {

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize
  {
    let image = UIImage(named: photos[indexPath.row])
    return image?.size ?? .zero
  }
}
