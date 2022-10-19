//
//  ViewController.swift
//  SpinnerReusable
//
//  Created by Javier Cueto on 19/10/22.
//

import UIKit

protocol ViewControllerCoordinator {
    func didTapNextScreenButton()
}

final class ViewController: UIViewController {
    // MARK: - Private properties
    private let coordinator: ViewControllerCoordinator
    
    
    private let myButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 5
        button.setTitle("Load Data", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let nextScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.layer.cornerRadius = 5
        button.setTitle("Next Screen", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    init(coordinator: ViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configConstraints()
        configTargets()
    }
    
    // MARK: - Helpers
    private func configUI() {
        view.backgroundColor = .systemBackground
        title = "Screen 1"
    }
    
    private func configConstraints(){
        view.addSubview(myButton)
        myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(nextScreenButton)
        nextScreenButton.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 10).isActive = true
        nextScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func configTargets() {
        myButton.addTarget(self, action: #selector(didTapMyButtonAction), for: .touchUpInside)
        nextScreenButton.addTarget(self, action: #selector(didTapNextScreenButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func didTapMyButtonAction() {
        showSpinner()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            print("load data from view Model")
            self?.hideSpinner()
        }
    }

    @objc
    private func didTapNextScreenButtonAction() {
        coordinator.didTapNextScreenButton()
    }

}

extension ViewController: SpinnerDisplayable {}

