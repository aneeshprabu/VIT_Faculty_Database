//
//  ViewController.swift
//  VIT Faculty
//
//  Created by Aneesh Prabu on 03/08/19.
//  Copyright © 2019 Aneesh Prabu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //MARK: - Initialize variables
    
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "goToTableView", sender: self)
    }
    
}

