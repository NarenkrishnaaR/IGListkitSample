//
//  FeedViewController.swift
//  Marslink
//
//  Created by Naren on 21/03/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit
import IGListKit

class FeedViewController: UIViewController,IGListAdapterDataSource,IGListAdapterDelegate {
  
  let loader = JournalEntryLoader()
  let collectionView: IGListCollectionView = {
    let pathfinder = Pathfinder()
    
    let view = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    view.backgroundColor = UIColor.black
    return view
  }()
  lazy var igAdapterList : IGListAdapter = {
    return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loader.loadLatest()
    view.addSubview(collectionView)
    igAdapterList.collectionView = collectionView
    igAdapterList.delegate = self
    igAdapterList.dataSource = self
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
    return loader.entries
  }
  
  func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
    return JounerlSectionController()
  }
  
  func emptyView(for listAdapter: IGListAdapter) -> UIView? {
    return nil
  }
  
  func listAdapter(_ listAdapter: IGListAdapter!, willDisplay object: Any!, at index: Int) {
    
  }
  
  func listAdapter(_ listAdapter: IGListAdapter!, didEndDisplaying object: Any!, at index: Int) {
    
  }
  
}
