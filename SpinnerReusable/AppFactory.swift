//
//  AppFactory.swift
//  SpinnerReusable
//
//  Created by Javier Cueto on 19/10/22.
//

import UIKit

struct AppFactory{
    let navigation: UINavigationController
    
    func makeRootViewController() -> UIViewController{
        let controller = ViewController(coordinator: self)
        navigation.pushViewController(controller, animated: true)
        return navigation
    }
}

extension AppFactory: ViewControllerCoordinator {
    func didTapNextScreenButton() {
        makeNextScreen()
    }
    
    func makeNextScreen(){
        let controller = NextViewController()
        navigation.pushViewController(controller, animated: true)
    }
}
