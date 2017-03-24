//
//  BoardViewController.swift
//  Pinterest
//
//  Created by Jessica Ellison on 3/23/17.
//  Copyright © 2017 JessCodes. All rights reserved.
//

import Foundation

class BoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  @IBOutlet var pinBoardCollectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.pinBoardCollectionView.backgroundColor = UIColor.red
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "boardCell", for: indexPath)
    return collectionView
  }

}
