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
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo's"
        
        fileCache.addTestTodoItemsToJSON()
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
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.modalPresentationStyle = .popover
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }
    
    @objc func addBarButtonTapped() {
        let vc = EditorViewController()
        navigationController?.present(UINavigationController(rootViewController: vc), animated: true)
    }
}
