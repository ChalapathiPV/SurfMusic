//
//  MusicListViewController.swift
//  SurfMusic
//
//  Created by PVC on 09/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import UIKit

final class MusicListViewController: UIViewController {
    
    var viewModel: MusicListViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            // Setup View Model
            setupViewModel(with: viewModel)
        }
    }
    
    var albumSearchController = UISearchController(searchResultsController: nil)

    // MARK: -
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.isHidden = true
            tableView.dataSource = self
            tableView.separatorInset = .zero
            tableView.rowHeight = UITableView.automaticDimension
            tableView.showsVerticalScrollIndicator = true
            tableView.tableHeaderView = albumSearchController.searchBar
            albumSearchController.searchBar.delegate = self as? UISearchBarDelegate
            albumSearchController.searchResultsUpdater = self as? UISearchResultsUpdating
        }
    }
    
    
    // MARK: -
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.startAnimating()
            activityIndicatorView.hidesWhenStopped = true
        }
    }
    
    // Mark: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup view
        setUpView()
    }
    
    // MARK: - Helper Methods
    
    private func setupViewModel(with viewModel: MusicListViewModel) {
        // Configure View Model
        
        DispatchQueue.main.async {
            // Hide Activity Indicator View
            self.activityIndicatorView.stopAnimating()
            
            // Update Table View
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
        
    }
    
    private func setUpView() {
        // Configure View
        view.backgroundColor = .lightGray
    }
    
}

extension MusicListViewController: UITableViewDataSource, UIBarPositioningDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = viewModel?.numberOfAlbums else {
            return 0
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.reuseIdentifier, for: indexPath) as? MusicTableViewCell else {
            fatalError("Unable to DequeueTable View Cell")
        }
        
        guard let viewModel = viewModel else {
            fatalError("No View Model Present")
        }
        
        // Configure Cell
        cell.configure(with: viewModel.viewModel(for: indexPath.row))
        
        return cell
    }
}

