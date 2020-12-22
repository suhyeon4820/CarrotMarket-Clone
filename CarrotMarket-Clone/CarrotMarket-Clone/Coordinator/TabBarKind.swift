//
//  TabBarKind.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit

enum TabBarKind: Int {
    case HomeBar
    case LifeBar
    case LocationBar
    case ChattingBar
    case MyCarrotBar
    
    var title: String? {
        switch self {
        case .HomeBar:
            return "Home"
        case .LifeBar:
            return "동네생활"
        case .LocationBar:
            return "내 근처"
        case .ChattingBar:
            return "채팅"
        case .MyCarrotBar:
            return "나의 당근"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .HomeBar:
            return UIImage(systemName: "person")
        case .LifeBar:
            return UIImage(systemName: "person")
        case .LocationBar:
            return UIImage(systemName: "person")
        case .ChattingBar:
            return UIImage(systemName: "person")
        case .MyCarrotBar:
            return UIImage(systemName: "person")
        }
    }
    
    var navigationController: UINavigationController {
        let navigation = UINavigationController()
        navigation.tabBarItem.title = self.title
        navigation.tabBarItem.image = self.image
        return navigation
    }
}
