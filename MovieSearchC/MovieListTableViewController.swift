//
//  WAMMovieListTableViewController.swift
//  MovieSearchC
//
//  Created by Will morris on 5/24/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    var results: [WAMMovie] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WAMMovieController.shared().movies.count;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell
        
        let movie = WAMMovieController.shared().movies[indexPath.row]
        cell?.movie = movie
        
        cell?.posterImageView.image = nil
        
        WAMMovieController.shared().fetchImage(atUrlString: movie.imageUrl) { (image) in
            DispatchQueue.main.async {
                cell?.posterImageView.image = image
            }
        }
        
        return cell ?? UITableViewCell()
    }
}

// MARK: - Delegates

extension MovieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        WAMMovieController.shared().searchMovie(withSearchTerm: searchTerm) { (results) in
            guard let results = results else { return }
            self.results = results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
