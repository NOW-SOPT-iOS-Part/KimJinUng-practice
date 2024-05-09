//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/5/24.
//

import UIKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let titleLabel = UILabel().then {
        $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = UIFont.pretendard(weight: .seven, size: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = UIFont.pretendard(weight: .six, size: 14)
        $0.layer.cornerRadius = 3
        $0.addPadding(left: 23)
        $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        $0.autocorrectionType = .no
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = UIFont.pretendard(weight: .six, size: 14)
        $0.layer.cornerRadius = 3
        $0.addPadding(left: 23)
        $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        $0.autocorrectionType = .no
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(weight: .seven, size: 18)
        $0.layer.cornerRadius = 6
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            
            idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 70),
            idTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 7),
            passwordTextField.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    // MARK: - Action
    
    @objc
    private func loginButtonDidTap(_ button: UIButton) {
        idTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        guard let id = idTextField.text,
              let password = passwordTextField.text
        else {
            return
        }
        
        let loginRequestModel = LoginRequestModel(id: id, password: password)
        
        UserService.shared.login(request: loginRequestModel) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success:
//                presentToWelcomeVC()
                pushToWelcomeVC()
            case .requestErr:
                print("요청 오류")
            case .decodedErr:
                print("디코딩 오류")
            case .pathErr:
                print("경로 오류")
            case .serverErr:
                print("서버 오류")
            case .networkFail:
                print("네트워크 오류")
            }
        }
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
