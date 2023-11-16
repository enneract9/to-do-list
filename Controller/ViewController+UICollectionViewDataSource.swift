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
        2 // self.todoItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodoItemCell.reuseID, for: indexPath) as? TodoItemCell else {
            fatalError("Cell dequeueing error!") // Fix it, looks bad?
        }
        
        // cell configuration. . .
        
        return cell
    }
}
