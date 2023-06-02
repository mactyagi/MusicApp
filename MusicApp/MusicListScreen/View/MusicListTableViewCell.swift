//
//  MusicListTableViewCell.swift
//  MusicApp
//
//  Created by Manu on 02/06/23.
//

import UIKit

class MusicListTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var artWorkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    static var identifier: String = "MusicListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        artWorkImageView.layer.cornerRadius = 10
    }
    
    func setupCell(musicData: Result){
        trackNameLabel.text = musicData.trackName ?? ""
        descriptionLabel.text = musicData.shortDescription ?? ""
        priceLabel.text = "- \(musicData.trackPrice ?? 0)$"
        artistNameLabel.text = "- \(musicData.artistName ?? "")"
        artWorkImageView.imageFromServerURL(urlString: musicData.artworkUrl100, PlaceHolderImage: nil)
    }

    
}
