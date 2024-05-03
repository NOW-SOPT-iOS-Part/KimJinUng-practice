//
//  ChatTableViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import UIKit
import Then
import SnapKit

final class ChatTableViewCell: UITableViewCell, ReuseIdentifiable {
    
    // MARK: - UIComponent
    
    private let profileImageView = UIImageView()
    
    private let nameLabel = UILabel()
    
    private let placeLabel = UILabel()
    
    private let chatLabel = UILabel()
    
    private let itemImageView = UIImageView()
    
    // MARK: - Intializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setViewHierarchy()
        setAutoLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatTableViewCell {
    
    // MARK: - SetUI
    
    private func setUI() {
        nameLabel.do {
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        }
        placeLabel.do {
            $0.textColor = UIColor(red: 156, green: 156, blue: 156, alpha: 1)
            $0.textAlignment = .left
            $0.font = UIFont(name: "Pretendard-Bold", size: 12)
        }
        chatLabel.do {
            $0.textColor = .black
            $0.textAlignment = .left
            $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        }
    }
    
    private func setViewHierarchy() {
        contentView.addSubviews(
            profileImageView,
            nameLabel,
            placeLabel, 
            chatLabel,
            itemImageView
        )
    }
    
    // MARK: - AutoLayout
    
    private func setAutoLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.top.equalTo(nameLabel).offset(2)
        }
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        itemImageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }
}

// MARK: - Data Binding

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        itemImageView.image = chatData.itemImg
    }
}
