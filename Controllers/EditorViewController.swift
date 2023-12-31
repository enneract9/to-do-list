//
//  EditorViewController.swift
//  project todolist
//
//  Created by @_@ on 22.11.2023.
//

import UIKit

class EditorViewController: UIViewController {
    
    private lazy var editorView = EditorView()
    
    override func loadView() {
        view = editorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Editor"

        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", image: nil, target: self, action: #selector(closeBarButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", image: nil, target: self, action: #selector(saveBarButtonTapped))
        
        navigationItem.rightBarButtonItem?.isEnabled = false // !
    }
    
    @objc func closeBarButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func saveBarButtonTapped() {
        
    }
}
