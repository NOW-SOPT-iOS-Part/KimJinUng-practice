//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김진웅 on 4/20/24.
//

import UIKit
import Then
import SnapKit

final class ChatViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Property

    private let chatList = ChatModel.dummy()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setViewHierarchy()
        setAutoLayout()
        configureDelegate()
    }
    
    private func configureDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}

extension ChatViewController {
    
    // MARK: - SetUI

    private func setUI() {
        view.backgroundColor = .systemBackground
        
        tableView.do {
            $0.register(
                ChatTableViewCell.self, 
                forCellReuseIdentifier: ChatTableViewCell.reuseIdentifier
            )
        }
    }
    
    private func setViewHierarchy() {
        view.addSubview(tableView)
    }
    
    // MARK: - AutoLayout
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
    }
}
