//
//  SecondVC.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit
import ECSlidingViewController

class SecondVC: UIViewController {
    
    @IBAction func buttonPressed() {
        if(self.slidingViewController().currentTopViewPosition == ECSlidingViewControllerTopViewPosition.centered){
            self.slidingViewController().anchorTopViewToRight(animated: true)
        } else {
            self.slidingViewController().resetTopView(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
