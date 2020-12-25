//
//  ChattingBarCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import RxSwift

class ChattingBarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> Observable<Void> {
        let chattingBarViewController: ChattingBarViewController = .instantiate()
        let chattingBarViewModel = ChattingBarViewModel()
        chattingBarViewModel.coordinator = self
        chattingBarViewController.viewModel = chattingBarViewModel
        chattingBarViewController.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "slider.horizontal.3"), tag: 3)
        navigationController.setViewControllers([chattingBarViewController], animated: false)
       return .never()
    }
    
    
}
