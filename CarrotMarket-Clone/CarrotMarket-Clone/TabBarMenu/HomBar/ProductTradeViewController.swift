//
//  ProductTradeViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/24.
//

import UIKit
import RxSwift
import RxCocoa

class ProductTradeViewController: UIViewController, Storyboarded, UITextFieldDelegate {
    
    var viewModel:ProductTradeViewModel!
    
    // 전체 스택뷰
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    // 카테고리 스택뷰(카테고리 + 버튼)
    let categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    let titleTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "제목"
        return field
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        return label
    }()
    
    let categoryButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(systemName: "chevron.down")
        return button
    }()

    let priceTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "가격 (선택사항)"
        return field
    }()

    let contentText: UITextView = {
        let text = UITextView()
        text.text = "올릴 게시글 내용을 작성해주세요.\n" + "가품 및 판매금지품목은 게시가 제한될 수 있어요."
        text.font = .systemFont(ofSize: 15)
        return text
    }()
    
    private let horizLine1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let horizLine2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let horizLine3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let horizLine4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var date = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        priceTextField.delegate = self
        
        setupHierarchy()
        setupLayout()
        navigationItem()
        
        
    }

    private func setupHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(horizLine1)///
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(horizLine2)///
        view.addSubview(categoryStackView)
        stackView.addArrangedSubview(categoryStackView)
        categoryStackView.addArrangedSubview(categoryLabel)
        categoryStackView.addArrangedSubview(categoryButton)
        stackView.addArrangedSubview(horizLine3)///
        stackView.addArrangedSubview(priceTextField)
        stackView.addArrangedSubview(horizLine4)///
        stackView.addArrangedSubview(contentText)
    }
   
    private func setupLayout() {
        NSLayoutConstraint.activate([
            // 위에서 떨어진 정도
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            // 바닥에서 떨어진 정도
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            // 오른쪽에서 떨어진 정도
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            // 왼쪽에서 떨어진 정도
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // 높이
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 90),
            imageView.widthAnchor.constraint(equalToConstant: 90),
            titleTextField.heightAnchor.constraint(equalToConstant: 60),
            priceTextField.heightAnchor.constraint(equalToConstant: 60),
            contentText.heightAnchor.constraint(equalToConstant: 200),
            horizLine1.heightAnchor.constraint(equalToConstant: 1),
            horizLine2.heightAnchor.constraint(equalToConstant: 1),
            horizLine3.heightAnchor.constraint(equalToConstant: 1),
            horizLine4.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    // MARK: - NavigationItem
    func navigationItem() {
        /// leftBarButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(dismissPage))
        navigationItem.leftBarButtonItem?.tintColor = .black
        /// rightBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completePage))
        navigationItem.rightBarButtonItem?.tintColor = .black
        /// title
        self.navigationItem.title = "중고거래 글쓰기"
    }
    /// leftBarButtonItem action
    @objc func dismissPage() {
        viewModel.didFinish()
        navigationController?.popViewController(animated: true)
    }
 
    
    /// leftBarButtonItem action
    @objc func completePage() {
        guard let itemTitle = titleTextField.text else { return }
        guard let itemPrice = Int(priceTextField.text!) else { return }
   
        DataManager.shared.createItem(title: itemTitle, price: itemPrice, category: "dd", content: "dd", createDate: date)
        NotificationCenter.default.post(name: Notification.Name("updateTable"), object: nil)
        
        viewModel.didFinish()
        navigationController?.popViewController(animated: true)
    }
   
}

//******************************************************

//class ProductTradeViewController: UIViewController, Storyboarded{
//
//    var viewModel: ProductTradeViewModel!
//    var libraryTitle: String = ""
//
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.register(ImageTableViewCell.nib(), forCellReuseIdentifier: ImageTableViewCell.identifier)
//        tableView.register(TitleTableViewCell.nib(), forCellReuseIdentifier: TitleTableViewCell.identifier)
//        tableView.register(PriceTableViewCell.nib(), forCellReuseIdentifier: PriceTableViewCell.identifier)
//        tableView.register(ContentTableViewCell.nib(), forCellReuseIdentifier: ContentTableViewCell.identifier)
//
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.allowsSelection = false
//
//        navigationItem()
//        //rxbind()
//
//    }
////    // MARK: - RxBind
////    func rxbind() {
////        // 화면 이동
////        addButton.rx.tap.bind { [self] in
////            viewModel.showAddScreen()
////        }.disposed(by: disposeBag)
////    }
//    // MARK: - NavigationItem
//    func navigationItem() {
//        /// leftBarButtonItem
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(dismissPage))
//        navigationItem.leftBarButtonItem?.tintColor = .black
//        /// rightBarButtonItem
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveTheData))
//        navigationItem.rightBarButtonItem?.tintColor = .black
//        /// title
//        self.navigationItem.title = "중고거래 글쓰기"
//    }
//    /// leftBarButtonItem action
//    @objc func dismissPage() {
//        dismiss(animated: true, completion: nil)
//    }
//
//
//    /// leftBarButtonItem action
//    @objc func saveTheData() {
//        //NotificationCenter.default.post(name: Notification.Name("updateTable"), object: nil)
//        //print(libraryTitle, "cc")
//        //dismiss(animated: true, completion: nil)
//        //viewModel.dismissPage()
//        self.viewModel.showAddScreen()
//
//    }
//
//}
//
//
//extension ProductTradeViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        if indexPath.row == 0 {
////            let imagePickerCell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath)
////            return imagePickerCell
////        }
////        if indexPath.row == 1 {
////            let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath)
////            return titleCell
////        }
////
////        if indexPath.row == 3 {
////            let priceCell = tableView.dequeueReusableCell(withIdentifier: PriceTableViewCell.identifier, for: indexPath)
////            return priceCell
////        }
////        if indexPath.row == 4 {
////            let contentCell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.identifier, for: indexPath)
////            return contentCell
////        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "카테고리"
//        cell.accessoryType = .disclosureIndicator
//
//        return cell
//    }
//
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return CGFloat(90)
//        } else if indexPath.row == 4 {
//            return CGFloat(230)
//        } else {
//            return CGFloat(60)
//        }
//    }
//
//}
