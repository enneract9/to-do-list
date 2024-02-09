//
//  ViewController+UICollectionViewDataSource.swift
//  project todolist
//
//  Created by @_@ on 16.11.2023.
//

import Foundation
import UIKit

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fileCache.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodoItemCell.reuseID, for: indexPath) as? TodoItemCell else {
            fatalError("Cell dequeueing error!") // TODO: Fix it, looks bad
        }
        
        let item = fileCache.items[indexPath.row]
        
        cell.title = item.title
        cell.deadline = item.deadline?.toString ?? "no deadline" // TODO: Unwrap (modify cell class)
        cell.importance = item.importance
        cell.isDone = item.isDone
        
        return cell
    }
}
