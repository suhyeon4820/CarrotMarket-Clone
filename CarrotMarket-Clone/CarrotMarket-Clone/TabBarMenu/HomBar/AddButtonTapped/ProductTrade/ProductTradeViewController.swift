//
//  ProductTradeViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/24.
//

import UIKit

class ProductTradeViewController: UIViewController, Storyboarded {
    
    var viewModel: ProductTradeViewModel!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        /// cell register
        tableView.register(ImagePickerTableViewCell.nib(), forCellReuseIdentifier: ImagePickerTableViewCell.identifier)
        tableView.register(TitleTableViewCell.nib(), forCellReuseIdentifier: TitleTableViewCell.identifier)
        tableView.register(PriceTableViewCell.nib(), forCellReuseIdentifier: PriceTableViewCell.identifier)
        tableView.register(ContentTableViewCell.nib(), forCellReuseIdentifier: ContentTableViewCell.identifier)
        navigationItem()
    }
    
    // MARK: - NavigationItem
    func navigationItem() {
        /// leftBarButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(dismissPage))
        navigationItem.leftBarButtonItem?.tintColor = .black
        /// rightBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .black
        /// title
        self.navigationItem.title = "중고거래 글쓰기"
    }
    /// leftBarButtonItem action
    @objc func dismissPage() {
        dismiss(animated: true, completion: nil)
    }
   
}

extension ProductTradeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let imagePickerCell = tableView.dequeueReusableCell(withIdentifier: ImagePickerTableViewCell.identifier, for: indexPath) as! ImagePickerTableViewCell
            return imagePickerCell
        }
        if indexPath.row == 1 {
            let imagePickerCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as! TitleTableViewCell
            return imagePickerCell
        }
  
        if indexPath.row == 3 {
            let imagePickerCell = tableView.dequeueReusableCell(withIdentifier: PriceTableViewCell.identifier, for: indexPath) as! PriceTableViewCell
            return imagePickerCell
        }
        if indexPath.row == 4 {
            let imagePickerCell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.identifier, for: indexPath) as! ContentTableViewCell
            return imagePickerCell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "카테고리"
        //cell.accessoryView = UIImage(systemName: "chevron.down")
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(80)
        } else if indexPath.row == 4 {
            return CGFloat(250)
        } else {
            return CGFloat(60)
        }
    }
    
}
