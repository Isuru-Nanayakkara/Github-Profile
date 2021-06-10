//
//  ProfileViewController.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit


extension ProfileViewController {
    struct Section {
        enum ScrollDirection {
            case vertical
            case horizontal
        }
        
        let title: String
        let repositories: [Repository]
        let scrollDirection: ScrollDirection
    }
}

class ProfileViewController: UIViewController {
    lazy private var tableView: UITableView = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = profileHeaderView
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.refreshControl = refreshControl
        tableView.register(TableViewRepositoryCell.self, forCellReuseIdentifier: TableViewRepositoryCell.reuseIdentifier)
        tableView.register(HorizontallyScrollableCell.self, forCellReuseIdentifier: HorizontallyScrollableCell.reuseIdentifier)
        return tableView
    }()
    lazy private var profileHeaderView: ProfileInfoHeaderView = {
        let view = ProfileInfoHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 220))
        return view
    }()
    
    private let sections: [Section] = [
        Section(title: "Pinned", repositories: MockData.pinnedRepos(), scrollDirection: .vertical),
        Section(title: "Top Repositories", repositories: MockData.topRepos(), scrollDirection: .horizontal),
        Section(title: "Starred Repositories", repositories: MockData.starredRepos(), scrollDirection: .horizontal)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        
        view.backgroundColor = .systemBackground
        
        setupTableView()
        profileHeaderView.set(profile: MockData.user())
    }
    
    // MARK: - UI Setup
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - API
    @objc private func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.refreshControl?.endRefreshing()
        }
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
            
            let repository = section.repositories[indexPath.row]
            cell.configure(withRepository: repository)
            
            return cell
        case .horizontal:
            let cell = tableView.dequeueReusableCell(withIdentifier: HorizontallyScrollableCell.reuseIdentifier, for: indexPath) as! HorizontallyScrollableCell
            
            cell.configure(withRepositories: section.repositories)
            
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = RepoListHeaderView()
        headerView.title = sections[section].title
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
