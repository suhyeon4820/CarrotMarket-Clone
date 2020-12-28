//
//  productListViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa


class HomeBarViewController: UIViewController, Storyboarded {
    
    // MARK: - Binding
    var viewModel: HomeBarViewModel!
    
    /// 데이터를 저장할 배열
    var list = [SellList]()
    
    private let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        tableView.delegate = self
        tableView.dataSource = self
        list = DataManager.shared.fetchTheDate()
        tableView.reloadData()
        tableView.register(HomeBarTableViewCell.nib(), forCellReuseIdentifier: HomeBarTableViewCell.identifier)
        
        view.addSubview(addButton)
        view.addSubview(plusIconImage)
        
        rxbind()
        setTitle()
        navigationItem()
        NotificationCenter.default.addObserver(self, selector: #selector(uploadTable), name: Notification.Name("updateTable"), object: nil)
    }
    
    @objc func uploadTable() {
        self.list = DataManager.shared.fetchTheDate()
        self.tableView.reloadData()
    }
    // MARK: - RxBind
    func rxbind() {
        // 화면 이동
        addButton.rx.tap.bind { [self] in
            viewModel.showAddScreen()
        }.disposed(by: disposeBag)
    }
    
    // MARK: - Title
    func setTitle() {
        let label = UILabel()
        label.textColor = .black
        label.text = "위치"
        label.font = .boldSystemFont(ofSize: 20)
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    // MARK: - NavigationItem
    func navigationItem() {
        let searchBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showPage))
        let categoryBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3") , style: .plain, target: self, action: nil)
        let alarmBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell") , style: .plain, target: self, action: nil)
        searchBarButtonItem.tintColor = .black
        categoryBarButtonItem.tintColor = .black
        alarmBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItems = [categoryBarButtonItem, searchBarButtonItem, alarmBarButtonItem]
    }
    
    @objc func showPage() {
        //viewModel.showPage()
    }
    
    // MARK: - AddButton
    let addButton: UIButton = {
        let addButton = UIButton(type: .custom)
        addButton.backgroundColor = .orange
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
        imageView.image = UIImage(systemName: "plus")
        imageView.tintColor = .white
        return imageView
    }()
}

extension HomeBarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeBarTableViewCell.identifier, for: indexPath) as! HomeBarTableViewCell
        let data = list[indexPath.row]
        cell.uploadData(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deleteItems = list.remove(at: indexPath.row)
            DataManager.shared.deleteItem(item: deleteItems)
            tableView.deleteRows(at: [indexPath], with: .left)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
