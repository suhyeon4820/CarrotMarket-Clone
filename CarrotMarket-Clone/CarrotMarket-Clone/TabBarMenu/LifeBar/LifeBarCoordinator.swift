//
//  File.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import RxSwift

class LifeBarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    func start() -> Observable<Void> {
        let lifeBarViewController: LifeBarViewController = .instantiate()
        let lifeBarViewModel = LifeBarViewModel()
        lifeBarViewModel.coordinator = self
        lifeBarViewController.viewModel = lifeBarViewModel
        lifeBarViewController.tabBarItem = UITabBarItem(title: "동네생활", image: UIImage(systemName: "newspaper"), tag: 1)
        navigationController.setViewControllers([lifeBarViewController], animated: false)
        return .never()
    }
    
    
}
