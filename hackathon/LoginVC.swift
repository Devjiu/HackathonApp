//
//  MenuViewController.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit
import ECSlidingViewController

class LoginVC: UIViewController {
    
    let pressedColor = UIColor(colorLiteralRed: 206/255, green: 178/255, blue: 112/255, alpha: 1)

    let unpressedColor = UIColor(colorLiteralRed: 236/255, green: 208/255, blue: 142/255, alpha: 1)

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var passwordTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonCenterConstraint: NSLayoutConstraint!
    
    let loginManager = LoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupViews()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateAppearing()
    }
    
    @IBAction func loginButtonPressed() {
        // Touch Down
        loginButton.backgroundColor = pressedColor
    }
    
    @IBAction func loginButtonUnpressed() {
        // Touch Up Inside
        loginButton.backgroundColor = unpressedColor
        // check password here
        loginManager.loginInput = loginField.text
        loginManager.passwordInput = passwordField.text
        if loginManager.check() {
            correctLogin()
        } else {
            incorrectLogin()
        }
    }
    
    // UI FUNCTIONS
    
    func setupConstraints() {
        loginTrailingConstraint.constant = UIScreen.main.bounds.height + 30
        passwordTrailingConstraint.constant = UIScreen.main.bounds.height + 30
        buttonCenterConstraint.constant = -UIScreen.main.bounds.height
    }
    
    func animateAppearing() {
        self.loginTrailingConstraint.constant = 30
        self.passwordTrailingConstraint.constant = 30
        self.buttonCenterConstraint.constant = 0
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func setupViews() {
        loginButton.layer.cornerRadius = 5.0
        loginButton.backgroundColor = unpressedColor
        errorLabel.alpha = 0
    }
    
    // LOGIN FUNCTIONS
    
    func correctLogin() {
        errorLabel.alpha = 0
        loginManager.setLoggedIn(logged: true)
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController : ECSlidingViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainVC") as! ECSlidingViewController
        initialViewController.anchorRightRevealAmount = UIScreen.main.bounds.width * 0.7
        self.present(initialViewController, animated: true) {
            
        }
    }
    
    func incorrectLogin() {
        errorLabel.alpha = 1
    }

}
