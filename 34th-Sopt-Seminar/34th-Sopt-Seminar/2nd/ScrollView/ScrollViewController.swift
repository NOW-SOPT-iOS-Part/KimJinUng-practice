//
//  ScrollViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/6/24.
//

import UIKit
import Then
import SnapKit

final class ScrollViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let redView = UIView().then {
        $0.backgroundColor = .red
    }
    private let orangeView = UIView().then {
        $0.backgroundColor = .orange
    }
    private let yellowView = UIView().then {
        $0.backgroundColor = .yellow
    }
    private let greenView = UIView().then {
        $0.backgroundColor = .green
    }
    private let blueView = UIView().then {
        $0.backgroundColor = .blue
    }
    private let purpleView = UIView().then {
        $0.backgroundColor = .purple
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
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(redView, orangeView, yellowView, greenView, blueView, purpleView)
    }
    
    // MARK: - AutoLayout
    
    private func setAutoLayout() {
        let half = view.frame.width / 2
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        redView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(400)
            $0.width.equalTo(half)
        }
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.height.equalTo(400)
            $0.width.equalTo(half)
        }
        yellowView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(redView.snp.bottom)
            $0.height.equalTo(400)
            $0.width.equalTo(half)
        }
        greenView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(orangeView.snp.bottom)
            $0.height.equalTo(400)
            $0.width.equalTo(half)
        }
        blueView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(yellowView.snp.bottom)
            $0.height.equalTo(400)
            $0.width.equalTo(half)
            $0.bottom.equalTo(contentView)
        }
        purpleView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(greenView.snp.bottom)
            $0.height.equalTo(400)
            $0.width.equalTo(half)
            $0.bottom.equalTo(contentView)
        }
    }
}
