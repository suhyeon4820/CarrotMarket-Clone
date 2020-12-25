//
//  LocationBarCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import RxSwift

class LocationBarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> Observable<Void> {
        let locationBarViewController: LocationBarViewController = .instantiate()
        let locationBarViewModel = LocationBarViewModel()
        locationBarViewModel.coordinator = self
        locationBarViewController.viewModel = locationBarViewModel
        locationBarViewController.tabBarItem = UITabBarItem(title: "내 근처", image: UIImage(systemName: "slider.horizontal.3"), tag: 2)
        navigationController.setViewControllers([locationBarViewController], animated: false)
        return .never()
    }
    
    
}
