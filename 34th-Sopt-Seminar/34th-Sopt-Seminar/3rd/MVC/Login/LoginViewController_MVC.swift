//
//  LoginViewController_MVC.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import UIKit
import Then
import SnapKit

final class LoginViewController_MVC: UIViewController {
    
    // MARK: - Property
    
    private let loginView = LoginView()
    
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
    }
    
    private func setTarget() {
        loginView.loginButton.addTarget(
            self,
            action: #selector(loginButtonDidTap),
            for: .touchUpInside
        )
    }
    
    // MARK: - Action
    
    @objc
    private func loginButtonDidTap(_ button: UIButton) {
        loginView.idTextField.resignFirstResponder()
        loginView.passwordTextField.resignFirstResponder()
        //        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        //        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: loginView.idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        //        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: loginView.idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}


