//
//  GithubGraphQLAPI.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

class GithubGraphQLAPI: GithubAPI {
    
    func fetchProfile(_ completion: @escaping (Result<Profile, Error>) -> ()) {
        GraphQLClient.shared.apollo.fetch(query: ProfileQuery(), cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let gqlResult):
                guard let user = gqlResult.data?.viewer else { return }
                
                let pinnedRepos = self.parsePinnedReposArray(user.pinnedItems.nodes?.compactMap({ $0?.asRepository }))
                let topRepos = self.parseTopReposArray(user.repositories.nodes?.compactMap { $0 })
                let starredRepos = self.parseStarredReposArray(user.starredRepositories.nodes?.compactMap { $0 })
                
                let profile = Profile(
                    avatar: user.avatarUrl,
                    name: user.name ?? "",
                    username: user.login,
                    email: user.email,
                    followers: user.followers.totalCount,
                    following: user.following.totalCount,
                    pinnedRepos: pinnedRepos,
                    topRepos: topRepos,
                    starredRepos: starredRepos
                )
                completion(.success(profile))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - Helper Methods
private extension GithubGraphQLAPI {
    
    func parsePinnedReposArray(_ nodes: [ProfileQuery.Data.Viewer.PinnedItem.Node.AsRepository]?) -> [Repository] {
        guard let nodes = nodes else { return [] }
        
        var pinnedRepos: [Repository] = []
        for node in nodes {
            let repo = Repository(ownerAvatar: node.owner.avatarUrl, ownerName: node.owner.login, name: node.name, description: node.description, stars: node.stargazerCount, langauge: node.primaryLanguage?.name ?? "Undefined", languageColor: node.primaryLanguage?.color ?? "d3d3d3")
            pinnedRepos.append(repo)
        }
        return pinnedRepos
    }
    
    func parseTopReposArray(_ nodes: [ProfileQuery.Data.Viewer.Repository.Node]?) -> [Repository] {
        guard let nodes = nodes else { return [] }
        
        var pinnedRepos: [Repository] = []
        for node in nodes {
            let repo = Repository(ownerAvatar: node.owner.avatarUrl, ownerName: node.owner.login, name: node.name, description: node.description, stars: node.stargazerCount, langauge: node.primaryLanguage?.name ?? "Undefined", languageColor: node.primaryLanguage?.color ?? "d3d3d3")
            pinnedRepos.append(repo)
        }
        return pinnedRepos
    }
    
    func parseStarredReposArray(_ nodes: [ProfileQuery.Data.Viewer.StarredRepository.Node]?) -> [Repository] {
        guard let nodes = nodes else { return [] }
        
        var pinnedRepos: [Repository] = []
        for node in nodes {
            let repo = Repository(ownerAvatar: node.owner.avatarUrl, ownerName: node.owner.login, name: node.name, description: node.description, stars: node.stargazerCount, langauge: node.primaryLanguage?.name ?? "Undefined", languageColor: node.primaryLanguage?.color ?? "d3d3d3")
            pinnedRepos.append(repo)
        }
        return pinnedRepos
    }
    
}
