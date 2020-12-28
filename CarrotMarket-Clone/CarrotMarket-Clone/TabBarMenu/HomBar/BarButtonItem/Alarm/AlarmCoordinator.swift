//
//  AlarmCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/25.
//

import UIKit
import RxSwift

class AlarmCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    func start() -> Observable<Void> {
        let alarmViewController: AlarmViewController = .instantiate()
        let alarmViewModel = AlarmViewModel()
        alarmViewModel.coordinator = self
        alarmViewController.viewModel = alarmViewModel
        navigationController.setViewControllers([alarmViewController], animated: false)
        return Observable.never()
    }
    
    
}
