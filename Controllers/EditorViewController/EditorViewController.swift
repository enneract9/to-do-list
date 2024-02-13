//
//  EditorViewController.swift
//  project todolist
//
//  Created by @_@ on 22.11.2023.
//

import UIKit

final class EditorViewController: UIViewController {
    
    // MARK: - Properties
    var todoItem: TodoItem? = nil
    
    private let editorView = EditorView()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = editorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Editor"
        
        editorView.textView.delegate = self
        
        setupNavigation()
        setupKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        editorView.title = todoItem?.title
        editorView.importance = todoItem?.importance
        editorView.deadline = todoItem?.deadline
    }
    
    // MARK: - Methods
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
    
    private func setupKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        editorView.textView.endEditing(true)
    }
}
