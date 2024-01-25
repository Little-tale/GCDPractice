//
//  ViewController.swift
//  GCDPractice
//
//  Created by Jae hyung Kim on 1/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let vc = GCDViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

