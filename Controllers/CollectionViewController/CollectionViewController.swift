//
//  ViewController.swift
//  project todolist
//
//  Created by @_@ on 12.11.2023.
//

import UIKit

final class CollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    let fileCache = FileCache()
    
    private let layout: UICollectionViewCompositionalLayout = {
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 16
        
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    // MARK: Lifecycle
    override func loadView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(TodoItemCell.self, forCellWithReuseIdentifier: TodoItemCell.reuseID)
        title = "Todo's"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fileCache.addTestTodoItemsToJSON()
//        fileCache.removeAllTodoItems()
        setupNavigation()
    }
    
    // MARK: Methods
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.modalPresentationStyle = .popover
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }
    
    @objc func addBarButtonTapped() {
        let editorViewController = EditorViewController()
        navigationController?.present(UINavigationController(rootViewController: editorViewController), animated: true)
    }
}
