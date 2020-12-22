//
//  Storyboarded.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit

//protocol Storyboarded {
//    static func instantiate(storyboardName: String) -> Self
//}
//
//extension Storyboarded where Self: UIViewController {
//    static func instantiate(storyboardName: String) -> Self {
//        let id = String(describing: self)
//        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
//        return storyboard.instantiateViewController(withIdentifier: id) as! Self
//    }
//}

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

//// 스토리보드에 접근해 자신의 타입 이름을 identifier로 가진 뷰컨트롤러를 반환해주는 함수
//extension UIViewController {
//
//    static func instantiate<T>() -> T {
//        let storyboard = UIStoryboard(name: "Main", bundle: .main)
//        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
//        return controller
//    }
//
//}
