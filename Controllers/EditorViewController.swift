//
//  EditorViewController.swift
//  project todolist
//
//  Created by @_@ on 22.11.2023.
//

import UIKit

class EditorViewController: UIViewController {
    
    let editorView = EditorView()
    
    override func loadView() {
        view = editorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Editor"

        setupNavigation()
    }
    

    
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeBarButtonTapped))
    }
    
    @objc func closeBarButtonTapped() {
        dismiss(animated: true)
    }
}
