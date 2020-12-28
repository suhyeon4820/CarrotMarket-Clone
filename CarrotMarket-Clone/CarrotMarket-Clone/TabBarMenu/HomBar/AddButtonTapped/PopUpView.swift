//
//  PopUpView.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/24.
//

import UIKit
import RxSwift
import RxCocoa


class PopUpView: UIView {
    private let disposeBag = DisposeBag()
    static let instance = PopUpView()
    
    let parentView: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        view.backgroundColor = .yellow
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        self.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 0.5)
        
        self.addSubview(addButton); self.addSubview(plusIconImage)
        self.addSubview(firstButton); self.addSubview(firstLabel)
        self.addSubview(secondButton); self.addSubview(secondLabel)
        rxBind()
    }
    // 네비게이션바 위에 보이게 하기 위함
    func showAddScreen() {
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    private func rxBind() {
        //addbutton Action
        addButton.rx.tap.bind {
            self.removeFromSuperview()
        }.disposed(by: disposeBag)
        
        firstButton.rx.tap.bind {
            print("firstButton")
        }.disposed(by: disposeBag)
        
        secondButton.rx.tap.bind {
            self.removeFromSuperview()
            var topVC = UIApplication.shared.keyWindow?.rootViewController
            while((topVC!.presentedViewController) != nil) {
                topVC = topVC!.presentedViewController
            }
            let vc = ProductTradeViewController.instantiate()
            let navController = UINavigationController(rootViewController: vc)
            navController.modalPresentationStyle = .fullScreen
            topVC?.present(navController, animated: true, completion: nil)
        }.disposed(by: disposeBag)
    }
    
    // MARK: - AddButton
    let addButton: UIButton = {
        let addButton = UIButton(type: .custom)
        addButton.backgroundColor = .white
        addButton.layer.frame = CGRect(x: 250, y: 450, width: 50, height: 50)
        // 테두리
        addButton.layer.cornerRadius = 25
        addButton.layer.borderWidth = 0.25
        addButton.layer.borderColor = UIColor.lightGray.cgColor
        addButton.clipsToBounds = true
        return addButton
    }()
    
    // MARK: - ButtonIcon
    let plusIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.frame = CGRect(x: 260, y: 460, width: 30, height: 30)
        imageView.image = UIImage(systemName: "multiply")
        imageView.tintColor = .orange
        return imageView
    }()
    
    let firstButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.setTitleColor(.white, for: .normal)
        button.layer.frame = CGRect(x: 250, y: 360, width: 40, height: 40)
        button.backgroundColor = .orange
        //addButton.imageView?.image = UIImage(systemName: "plus.circle")
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.25
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.clipsToBounds = true
        return button
    }()
    let secondButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.setTitleColor(.white, for: .normal)
        button.layer.frame = CGRect(x: 250, y: 400, width: 40, height: 40)
        button.backgroundColor = .orange
        //addButton.imageView?.image = UIImage(systemName: "plus.circle")
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.25
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.clipsToBounds = true
        return button
    }()

    let firstLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 170, y: 380, width: 65, height: 20))
        label.text = "동네홍보"
        label.textColor = .white
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 170, y: 410, width: 65, height: 20))
        label.text = "중고거래"
        label.textColor = .white
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopUpView {
    var parentViewController: ProductTradeViewController? {
            sequence(first: self) { $0.next }
                .compactMap{ $0 as? ProductTradeViewController }
                .first
        }

}

