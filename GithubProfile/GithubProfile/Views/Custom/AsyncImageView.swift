//
//  AsyncImageView.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import UIKit

class AsyncImageView: UIImageView {
    lazy private(set) var activityIndicatorView: UIActivityIndicatorView = {
        var activityIndicatorView: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            activityIndicatorView = UIActivityIndicatorView(style: .medium)
            activityIndicatorView.color = .systemGray
        } else {
            activityIndicatorView = UIActivityIndicatorView(style: .gray)
        }
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
        setupActivityIndicatorView()
    }
    
    private func updateCornerRadius() {
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
        clipsToBounds = true
    }
    
    private func setupActivityIndicatorView() {
        addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: - Public API
extension AsyncImageView {
    func loadImage(from url: URL, placeholder: UIImage? = nil, cache: URLCache? = nil, showActivityIndicator: Bool = true) {
        let cache = cache ?? URLCache.shared
        let request = URLRequest(url: url)
        
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            // If image data exists in cache, load image from there
            self.image = image
        } else {
            self.image = placeholder
            
            activityIndicatorView.isHidden = !showActivityIndicator
            activityIndicatorView.startAnimating()
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let imageData = data, let image = UIImage(data: imageData), let response = response {
                    // Save image data to cache
                    let cacheResponse = CachedURLResponse(response: response, data: imageData)
                    cache.storeCachedResponse(cacheResponse, for: request)
                    
                    DispatchQueue.main.async {
                        self.activityIndicatorView.stopAnimating()
                        self.image = image
                    }
                }
            }.resume()
        }
    }
    
    func loadImage(from urlString: String, placeholder: UIImage? = nil, cache: URLCache? = nil, showActivityIndicator: Bool = true) {
        guard let url = URL(string: urlString) else { return }
        loadImage(from: url, placeholder: placeholder, cache: cache, showActivityIndicator: showActivityIndicator)
    }
}
