//
//  ViewController+UICollectionViewDelegate.swift
//  project todolist
//
//  Created by @_@ on 16.11.2023.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let editorViewController = EditorViewController()
        editorViewController.todoItem = fileCache.items[indexPath.row]
        
        navigationController?.present(UINavigationController(rootViewController: editorViewController), animated: true)
    }
}
