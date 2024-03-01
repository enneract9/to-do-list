//
//  ViewController+UICollectionViewDataSource.swift
//  project todolist
//
//  Created by @_@ on 16.11.2023.
//

import Foundation
import UIKit

// MARK: - UICollectionViewDataSource methods
extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fileCache.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodoItemCell.reuseID, for: indexPath) as? TodoItemCell else {
            fatalError("Cell dequeueing error!") // TODO: Fix it, looks bad
        }
        
        let item = fileCache.items[indexPath.row]
        
        cell.title = item.title
        cell.deadline = item.deadline
        cell.importance = item.importance
        cell.isDone = item.isDone
        
        return cell
    }
}
