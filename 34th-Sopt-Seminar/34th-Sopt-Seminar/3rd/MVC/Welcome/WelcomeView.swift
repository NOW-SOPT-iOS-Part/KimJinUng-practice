//
//  WelcomeView.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import UIKit
import Then
import SnapKit

final class WelcomeView: UIView {
    
    // MARK: - UIComponent
    
    private let logoImageView = UIImageView().then {
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
    
    let backToLoginButton = UIButton().then {
        $0.frame = CGRect(x: 20, y: 498, width: 335, height: 58)
        $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        $0.setTitle("다시 로그인", for: .normal)
        $0.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(weight: .seven, size: 18)
        $0.layer.cornerRadius = 6
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        backgroundColor = .systemBackground
        setViewHierarchy()
        setAutoLayout()
    }
    
    private func setViewHierarchy() {
        addSubviews(logoImageView, welcomeLabel, goHomeButton, backToLoginButton)
    }
    
    // MARK: - AutoLayout
    
    private func setAutoLayout() {
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(87)
            $0.width.height.equalTo(150)
        }
    }
    
    func bindID(_ id: String?) {
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
}
