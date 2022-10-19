//
//  SpinnerDisplayable.swift
//  SpinnerReusable
//
//  Created by Javier Cueto on 19/10/22.
//

import UIKit

protocol SpinnerDisplayable: AnyObject {
    func showSpinner()
    func hideSpinner()
}

extension SpinnerDisplayable where Self : UIViewController {
    func showSpinner() {
        guard doesNotExistAnotherSpinner else { return }
        configureSpinner()
    }
    
    private func configureSpinner() {
        let containerView = UIView()
        containerView.tag = tagIdentifier
        containerView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: parentView.rightAnchor).isActive = true
        containerView.backgroundColor = .black.withAlphaComponent(opacity)
        addSpinnerIndicatorToContainer(containerView: containerView)
    }
    
    private func addSpinnerIndicatorToContainer(containerView: UIView) {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        spinner.startAnimating()
    }
    
    func hideSpinner(){
        if let foundView = parentView.viewWithTag(tagIdentifier) {
            foundView.removeFromSuperview()
        }
    }
    
    private var doesNotExistAnotherSpinner: Bool {
        parentView.viewWithTag(tagIdentifier) == nil
    }
    
    private var parentView: UIView {
        navigationController?.view ?? view
    }
    
    private var tagIdentifier: Int {
        117
    }
    
    private var opacity: CGFloat {
        0.3
    }
}
