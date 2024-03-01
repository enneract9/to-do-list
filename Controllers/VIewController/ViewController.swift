//
//  ViewController.swift
//  project todolist
//
//  Created by @_@ on 12.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    let fileCache = FileCache()
    
    private lazy var collectionView: UICollectionView = {
        
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 16
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo's"
        
//        fileCache.addTestTodoItemsToJSON()
//        fileCache.removeAllTodoItems()
        
        view.addSubview(collectionView)
        
        collectionView.register(TodoItemCell.self, forCellWithReuseIdentifier: TodoItemCell.reuseID)
        setupConstraints()
        setupNavigation()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // collectionView
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
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
