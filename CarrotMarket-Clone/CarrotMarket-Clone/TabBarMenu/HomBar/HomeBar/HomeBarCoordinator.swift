//
//  productListCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import RxSwift

class HomeBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    func start() -> Observable<Void> {
        let homeBarViewController: HomeBarViewController = .instantiate()
        let hoemBarViewModel = HomeBarViewModel()
        hoemBarViewModel.coordinator = self
        homeBarViewController.viewModel = hoemBarViewModel
        homeBarViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0 )
        navigationController.setViewControllers([homeBarViewController], animated: false)
        return .never()
    }
    
    
    /// addButton popup
    func showAddScreen() {
        PopUpView.instance.showAddScreen()
    }

    
}


