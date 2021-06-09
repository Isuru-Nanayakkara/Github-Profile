//
//  ProfileViewController.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

struct Section {
    enum ScrollDirection {
        case vertical
        case horizontal
    }
    
    let title: String
    let repositories: [Repository]
    let scrollDirection: ScrollDirection
}

struct Repository {
    let name: String
}


class ProfileViewController: UIViewController {
    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = headerView
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TableViewRepositoryCell.self, forCellReuseIdentifier: TableViewRepositoryCell.reuseIdentifier)
        tableView.register(HorizontallyScrollableCell.self, forCellReuseIdentifier: HorizontallyScrollableCell.reuseIdentifier)
        return tableView
    }()
    lazy private var headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private let sections: [Section] = [
        .init(title: "Pinned", repositories: [.init(name: "ActivityIndicatorOverlayView"), .init(name: "InstagramAuthViewController"), .init(name: "CountrySelectorView")], scrollDirection: .vertical),
        .init(title: "Top Repositories", repositories: [.init(name: "HttpManager"), .init(name: "Reach"), .init(name: "Broadband-Usage-Meter-OSX")], scrollDirection: .horizontal),
        .init(title: "Starred Repositories", repositories: [.init(name: "RESideMenu"), .init(name: "MMAppSwitcher"), .init(name: "SimpleAuth")], scrollDirection: .horizontal),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        switch section.scrollDirection {
        case .vertical:
            return section.repositories.count
        case .horizontal:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section.scrollDirection {
        case .vertical:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewRepositoryCell.reuseIdentifier, for: indexPath) as! TableViewRepositoryCell
            return cell
        case .horizontal:
            let cell = tableView.dequeueReusableCell(withIdentifier: HorizontallyScrollableCell.reuseIdentifier, for: indexPath) as! HorizontallyScrollableCell
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
