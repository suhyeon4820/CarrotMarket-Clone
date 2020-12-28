//
//  BaseCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
// https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-viewmodels-4-6-537a52d1ca9e

import Foundation
import RxSwift

// UITableView를 컨테이너뷰에 넣어서 사용할때 발생하는 에러 발생
protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    @discardableResult
    func start() -> Observable<Void>
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

    @discardableResult
    func start() -> Observable<Void> {
        
        window.rootViewController = TabBarViewController()
        window.makeKeyAndVisible()
      
        return .never()
        
    }
}
