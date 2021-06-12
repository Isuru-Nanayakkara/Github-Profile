//
//  ProfileViewController.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

private extension ProfileViewController {
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
        refreshControl.addTarget(self, action: #selector(fetchProfile), for: .valueChanged)
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = profileHeaderView
        tableView.separatorStyle = .none
        tableView.backgroundColor = ColorFactory.systemBackground
        tableView.refreshControl = refreshControl
        tableView.register(TableViewRepositoryCell.self, forCellReuseIdentifier: TableViewRepositoryCell.reuseIdentifier)
        tableView.register(HorizontallyScrollableCell.self, forCellReuseIdentifier: HorizontallyScrollableCell.reuseIdentifier)
        return tableView
    }()
    lazy private var profileHeaderView: ProfileInfoHeaderView = {
        let view = ProfileInfoHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 220))
        return view
    }()
    private var sections: [Section] = []
    private var presenter: ProfilePresenter!
    
    
    init(presenter: ProfilePresenter) {
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenter
        self.presenter.setDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.backgroundColor = ColorFactory.systemBackground
        
        // UI setup
        setupTableView()
        
        // Data loading
        fetchProfile()
    }
    
    // MARK: - UI
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func render(with profile: Profile) {
        profileHeaderView.set(profile: profile)
        
        sections.removeAll()
        if !profile.pinnedRepos.isEmpty {
            sections.append(Section(title: "Pinned", repositories: profile.pinnedRepos, scrollDirection: .vertical))
        }
        if !profile.topRepos.isEmpty {
            sections.append(Section(title: "Top Repositories", repositories: profile.topRepos, scrollDirection: .horizontal))
        }
        if !profile.starredRepos.isEmpty {
            sections.append(Section(title: "Starred Repositories", repositories: profile.starredRepos, scrollDirection: .horizontal))
        }
        tableView.reloadData()
    }
    
    // MARK: - API
    @objc private func fetchProfile() {
        presenter.fetchProfileData()
    }
}

// MARK: - ProfilePresenterDelegate
extension ProfileViewController: ProfilePresenterDelegate {
    func didFetchProfileData(_ profile: Profile) {
        tableView.refreshControl?.endRefreshing()
        render(with: profile)
    }
    
    func errorOccurred(_ error: Error) {
        tableView.refreshControl?.endRefreshing()
        
        let alert = ErrorAlert(message: error.localizedDescription)
        alert.present(in: self)
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
}
