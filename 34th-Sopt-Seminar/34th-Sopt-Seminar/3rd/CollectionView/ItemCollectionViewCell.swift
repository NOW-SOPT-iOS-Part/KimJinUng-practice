//
//  ItemCollectionViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import UIKit
import Then
import SnapKit

protocol ItemCollectoinViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

final class ItemCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    
    // MARK: - UIComponent
    
    private let itemImageView = UIImageView()
    
    private let nameLabel = UILabel()
    
    private let priceLabel = UILabel()
    
    private let heartButton = UIButton()
    
    // MARK: - Property

    var itemRow: Int?
    
    weak var delegate: ItemCollectoinViewCellDelegate?
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setUI()
        setViewHierarchy()
        setAutoLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        heartButton.isSelected = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action

    @objc func heartButtonDidTap() {
        self.heartButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.heartButtonDidTapEvent(
                state: self.heartButton.isSelected,
                row: itemRow
            )
        }
    }
}

extension ItemCollectionViewCell {
    
    // MARK: - SetUI
    
    private func setUI() {
        nameLabel.do {
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        }
        
        priceLabel.do {
            $0.textColor = .orange
            $0.textAlignment = .left
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        }
        
        heartButton.do {
            $0.setImage(.love, for: .normal)
            $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
            $0.tintColor = .red
            $0.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        }
    }
    
    private func setViewHierarchy() {
        contentView.addSubviews(itemImageView, nameLabel, priceLabel, heartButton)
    }
    
    // MARK: - AutoLayout

    private func setAutoLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
}

// MARK: - Data Binding

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        itemImageView.image = itemData.itemImg
        nameLabel.text = itemData.name
        priceLabel.text =  itemData.price
        heartButton.isSelected = itemData.heartIsSelected
        self.itemRow = itemRow
    }
}
