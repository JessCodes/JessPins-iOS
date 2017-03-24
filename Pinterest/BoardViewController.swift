//
//  BoardViewController.swift
//  Pinterest
//
//  Created by Jessica Ellison on 3/23/17.
//  Copyright © 2017 JessCodes. All rights reserved.
//

import Foundation
import SDWebImage

class BoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  let networkHandler = PinterestNetworking()
  var boardData = [BoardDataModel]() {
    didSet {
      pinBoardCollectionView.reloadData()
    }
  }
  
  @IBOutlet var pinBoardCollectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    networkHandler.getBoardData(completionHandler: {(response) -> Void in
      self.boardData = response
    })
    
    self.pinBoardCollectionView.backgroundColor = UIColor.red
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return boardData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "boardCell", for: indexPath)
    let view = UIView()
    let imageView = UIImageView()
    imageView.frame = cell.bounds
    imageView.sd_setImage(with: URL(string: boardData[indexPath.row].image), placeholderImage: nil, options: .refreshCached)
    view.addSubview(imageView)
    cell.backgroundView = view
    return cell
  }

}
