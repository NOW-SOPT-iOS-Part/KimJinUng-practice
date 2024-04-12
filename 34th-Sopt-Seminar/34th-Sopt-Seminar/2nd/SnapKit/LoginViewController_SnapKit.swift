//
//  LoginViewController_SnapKit.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/6/24.
//

import UIKit
import Then
import SnapKit

final class LoginViewController_SnapKit: UIViewController {
    
    // MARK: - UIComponent
    
    private let titleLabel = UILabel().then {
        $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = UIFont.pretendard(weight: .seven, size: 18)
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = UIFont.pretendard(weight: .six, size: 14)
        $0.layer.cornerRadius = 3
        $0.addPadding(left: 23)
        $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        $0.autocorrectionType = .no
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = UIFont.pretendard(weight: .six, size: 14)
        $0.layer.cornerRadius = 3
        $0.addPadding(left: 23)
        $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        $0.autocorrectionType = .no
    }
    
    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(weight: .seven, size: 18)
        $0.layer.cornerRadius = 6
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        view.backgroundColor = .systemBackground
        setViewHierarchy()
        setAutoLayout()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(titleLabel, idTextField, passwordTextField, loginButton)
    }
    
    // MARK: - AutoLayout
    
    private func setAutoLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(160)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(70)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.left.right.equalTo(idTextField)
            $0.height.equalTo(idTextField.snp.height)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.left.right.equalTo(passwordTextField)
            $0.height.equalTo(passwordTextField.snp.height)
        }
    }
    
    // MARK: - Action
    
    @objc
    private func loginButtonDidTap(_ button: UIButton) {
        idTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        //        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        //        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        //        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

