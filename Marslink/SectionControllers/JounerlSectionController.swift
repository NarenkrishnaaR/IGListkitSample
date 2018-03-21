//
//  JounerlSectionController.swift
//  Marslink
//
//  Created by Naren on 21/03/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit
import IGListKit

class JounerlSectionController: IGListSectionController,IGListSectionType {
  
  var entry: JournalEntry!
  let solFormatter = SolFormatter()
  
  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
  }
  
  func numberOfItems() -> Int {
    return 2
  }
  
  func sizeForItem(at index: Int) -> CGSize {
    return .zero
  }
  
  func cellForItem(at index: Int) -> UICollectionViewCell {
    let cellClass: AnyClass = index == 0 ? JournalEntryDateCell.self : JournalEntryCell.self
    let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
    if let cell = cell as? JournalEntryDateCell {
      cell.label.text = "SOL \(solFormatter.sols(fromDate: entry.date))"
    } else if let cell = cell as? JournalEntryCell {
      cell.label.text = entry.text
    }
    return cell
  }
  
  func didUpdate(to object: Any) {
    entry = object as? JournalEntry
  }
  
  func didSelectItem(at index: Int) {
    
  }
  
}