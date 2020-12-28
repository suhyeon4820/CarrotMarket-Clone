//
//  ChattingBarViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit

class ChattingBarViewController: UIViewController, Storyboarded {
    
    var viewModel: ChattingBarViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarItem.selectedImage = UIImage(systemName: "bubble.left.and.bubble.right.fill")
        view.backgroundColor = .cyan
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
