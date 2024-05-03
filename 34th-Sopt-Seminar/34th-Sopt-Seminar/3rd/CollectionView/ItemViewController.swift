//
//  ItemViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import UIKit
import Then
import SnapKit

final class ItemViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // MARK: - Property
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    private var itemData = ItemModel.dummy() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setUI()
        setViewHierarchy()
        setAutoLayout()
        configureDelegate()
    }
    
    private func configureDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(itemData.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return carrotLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return carrotInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return carrotInset
    }
}

// MARK: - UICollectionViewDataSource

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        cell.delegate = self
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

// MARK: - ItemCollectoinViewCellDelegate

extension ItemViewController: ItemCollectoinViewCellDelegate {
    func heartButtonDidTapEvent(state: Bool, row: Int) {
        itemData[row].heartIsSelected = state
    }
}

extension ItemViewController {
    
    // MARK: - SetUI
    
    private func setUI() {
        view.backgroundColor = .systemBackground
        
        collectionView.do {
            $0.register(
                ItemCollectionViewCell.self,
                forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier
            )
        }
    }
    
    private func setViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    // MARK: - AutoLayout
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeArea)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
}
