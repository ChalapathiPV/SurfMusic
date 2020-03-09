//
//  MusicTableViewCell.swift
//  SurfMusic
//
//  Created by PVC on 10/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

  // MARK: - Static Properties

       static var reuseIdentifier: String {
           return String(describing: self)
       }

    // MARK: - Properties
    
    @IBOutlet var albumName: UILabel! {
        didSet {
            albumName.textColor = UIColor.systemBlue
            albumName.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }
    
    @IBOutlet var listnersLabel: UILabel! {
        didSet {
            listnersLabel.textColor = .black
            listnersLabel.font = UIFont.boldSystemFont(ofSize: 14)
        }
    }
    
    @IBOutlet var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
        }
    }

    
       // MARK: - Initialization

       override func awakeFromNib() {
           super.awakeFromNib()

           // Configure Cell
        selectionStyle = .gray
       }
    
    // MARK: - Public API

    func configure(with representable: AlbumRepresentable) {
        albumName.text = representable.albumName
        listnersLabel.text = representable.listners
        guard let urlString = representable.imageUrl,
            let imageUrl = URL(string: urlString) else {
            return
        }
        iconImageView.load(url: imageUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
