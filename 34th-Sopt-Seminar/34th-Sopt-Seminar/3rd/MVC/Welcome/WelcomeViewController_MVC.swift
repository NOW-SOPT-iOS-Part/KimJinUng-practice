//
//  WelcomeViewController_MVC.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import UIKit
import Then
import SnapKit

final class WelcomeViewController_MVC: UIViewController {
    
    // MARK: - Property
    
    private let welcomeView = WelcomeView()
    
    private var id: String? {
        didSet {
            welcomeView.bindID(id)
        }
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    private func setTarget() {
        welcomeView.backToLoginButton.addTarget(
            self,
            action: #selector(backToLoginButtonDidTap),
            for: .touchUpInside
        )
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


