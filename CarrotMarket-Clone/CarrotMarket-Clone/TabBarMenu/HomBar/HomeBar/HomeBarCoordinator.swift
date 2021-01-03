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
        homeBarViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        //homeBarViewController.tabBarItem = UITabBarItem.appearance()
        navigationController.setViewControllers([homeBarViewController], animated: false)
        return .never()
    }
    
    /// addButton popup
    func showAddScreen() {
        PopUpView.instance.showAddScreen()
    }
    
    func showProductTradePage() {
        let tradeProductCoordinator = ProductTradeCoordiantor(navigationcontroller: navigationController)
        tradeProductCoordinator.parentCoordinator = self
        childCoordinators.append(tradeProductCoordinator)
        tradeProductCoordinator.start()
    }
    
    func showSearcItem() {
        let searchItemCoordinator = SearchItemCoordinator(navigationController: navigationController)
        searchItemCoordinator.parentCoordinator = self
        childCoordinators.append(searchItemCoordinator)
        searchItemCoordinator.start()
    }
    
    func showCategoryItem() {
        let categoryCoordinator = CategoryCoordinator(navigationController: navigationController)
        categoryCoordinator.parentCoordinator = self
        childCoordinators.append(categoryCoordinator)
        categoryCoordinator.start()
    }
    
    func showAlarmItem() {
        let alarmCoordinator = AlarmCoordinator(navigationController: navigationController)
        alarmCoordinator.parentCoordinator = self
        childCoordinators.append(alarmCoordinator)
        alarmCoordinator.start()
    }
    
    // childCoordinator 종료할때 호출 -> 리스트에서 제거
    func childDidFinish(_ childCoordinator: Coordinator) {
        print("parentCoordinator")
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
        
    }

    
}


