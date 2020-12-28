//
//  BaseCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import Foundation
import RxSwift

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start() -> Observable<Void>
}

enum Scene {
    case HomeBar
    case LifeBar
    case LocationBar
    case ChattingBar
    case MyCarrotBar
}
class AppCoordinator: Coordinator {

    let disposeBag = DisposeBag()

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private var window: UIWindow

    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() -> Observable<Void> {
       
//        let homBarCoordinator = HomeBarCoordinator(navigationController: navigationController)
//        childCoordinators.append(homBarCoordinator)
        
        let tabBarVC = UITabBarController()
        
        let HomeBar = HomeBarViewController.instantiate()
        let LifeBar = LifeBarViewController.instantiate()
        let LocationBar = LocationBarViewController.instantiate()
        let ChattinbBar = ChattingBarViewController.instantiate()
        let MyCarrotBar = MyCarrotBarViewController.instantiate()

        HomeBar.title = TabBarKind.HomeBar.title
        LifeBar.title = TabBarKind.LifeBar.title
        LocationBar.title = TabBarKind.LocationBar.title
        ChattinbBar.title = TabBarKind.ChattingBar.title
        MyCarrotBar.title = TabBarKind.MyCarrotBar.title
        
        tabBarVC.setViewControllers([HomeBar, LifeBar, LocationBar, ChattinbBar, MyCarrotBar], animated: false)
     
        self.navigationController.pushViewController(tabBarVC, animated: true)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return .never()
        
    }
}
