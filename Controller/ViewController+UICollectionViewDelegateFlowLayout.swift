//
//  ViewController+UICollectionViewDelegateFlowLayout.swift
//  project todolist
//
//  Created by @_@ on 16.11.2023.
//

import Foundation
import UIKit

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 100) // height? 
    }
}
