//
//  NextViewController.swift
//  SpinnerReusable
//
//  Created by Javier Cueto on 19/10/22.
//

import UIKit

final class NextViewController: UIViewController {
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Next Screen"
        showSpinner()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            print("load data next screen from view Model")
            self?.hideSpinner()
        }
    }
    
    // MARK: - Helpers
    
    // MARK: - Actions
    
}

// MARK: - Extensions here
extension NextViewController: SpinnerDisplayable {}
