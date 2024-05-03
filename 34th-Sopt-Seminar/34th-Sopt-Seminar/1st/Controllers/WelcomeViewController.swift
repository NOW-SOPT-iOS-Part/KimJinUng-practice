//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/5/24.
//

import UIKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let logoImageView = UIImageView().then {
        $0.frame = CGRect(x: 112, y: 87, width: 150, height: 150)
        $0.image = UIImage(named: "logo2")
    }
    
    private let welcomeLabel = UILabel().then {
        $0.frame = CGRect(x: 140, y: 295, width: 95, height: 60)
        $0.text = "???님 \n반가워요!"
        $0.font = UIFont.pretendard(weight: .eight, size: 25)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private lazy var goHomeButton = UIButton().then {
        $0.frame = CGRect(x: 20, y: 426, width: 335, height: 58)
        $0.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 6
        $0.titleLabel?.font = UIFont.pretendard(weight: .seven, size: 18)
    }
    
    private lazy var backToLoginButton = UIButton().then {
        $0.frame = CGRect(x: 20, y: 498, width: 335, height: 58)
        $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        $0.setTitle("다시 로그인", for: .normal)
        $0.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(weight: .seven, size: 18)
        $0.layer.cornerRadius = 6
        $0.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Property
    
    private var id: String? {
        didSet {
            bindID()
        }
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
    }
    
    private func setViewHierarchy() {
        view.addSubviews(logoImageView, welcomeLabel, goHomeButton, backToLoginButton)
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    private func bindID() {
//        if let idText = id {
//            welcomeLabel.text = "\(idText)님\n안녕하세요."
//        }
        
        guard let idText = id,
              idText.count != 0
        else {
            return
        }
        welcomeLabel.text = "\(idText)님\n안녕하세요."
    }
    
    // MARK: - Action
    
    @objc
    private func backToLoginButtonDidTap(_ button: UIButton) {
        if navigationController == nil {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
