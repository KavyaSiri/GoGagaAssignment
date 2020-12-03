//
//  ViewController.swift
//  GoGaga
//
//  Created by Kavya Sri on 23/11/20.
//

import UIKit

class ViewController: UIViewController {

                                                                                                                                                                                                         
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }


    @IBAction func buttonAction(_ sender: UIButton) {
        let viewController = ProfileTableViewController(nibName: "ProfileTableViewController", bundle: nil)
       // self.present(viewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

