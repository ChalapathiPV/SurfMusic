//
//  RootViewController.swift
//  SurfMusic
//
//  Created by PVC on 08/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: RootViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            // Setup View Model
            setupViewModel(with: viewModel)
        }
    }
    
    private let musicListViewController:MusicListViewController = {
        
        guard let musiclistViewController = UIStoryboard.main.instantiateViewController(identifier: MusicListViewController.storyboardIdentifier) as? MusicListViewController else {
            fatalError("Unable to intantiate music view controller")
        }
        
        // Configure Music list view Controller
        musiclistViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return musiclistViewController
        
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup child view
        setUpChildViewControllers()
        
        print(viewModel ?? "No View Model Injected")
        
    }
    
    private func setUpChildViewControllers() {
        
        // Add child Views
        addChild(musicListViewController)
        
        // Add child view as subview
        view.addSubview(musicListViewController.view)
        
        //Configure music list view
        musicListViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        musicListViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        musicListViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        musicListViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // Notify child view controller
        musicListViewController.didMove(toParent: self)
    }
    
    private func setupViewModel(with viewModel: RootViewModel) {
        // Configure View Model
        viewModel.didFetchMusicData = { (data, error) in
            if let error = error {
                print("Unable to Fetch  Data (\(error)")
            } else if let data = data {
                print(data)
            }
        }
    }
}

