//
//  MusicCell.swift
//  GMCodingChallenge
//
//  Created by Hin Wong on 6/7/21.
//

import UIKit

class MusicCell: UITableViewCell {
    
    static let identifier = "MusicCell"

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    @IBOutlet weak var primaryGenreNameLabel: UILabel!
    @IBOutlet weak var musicImageView: UIImageView!
    
    var cellViewModel: MusicDetailsVM? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: MusicDetailsVM) {
        self.cellViewModel = viewModel
    }

    func updateUI() {
        if let cellViewModel = cellViewModel {
            artistNameLabel?.text = cellViewModel.getArtistName()
            primaryGenreNameLabel?.text = cellViewModel.getPrimaryGenreName()
            releaseDateLabel?.text = cellViewModel.getReleaseDate()
            trackPriceLabel?.text =  "$" + String(cellViewModel.getTrackPrice())
            trackNameLabel?.text = cellViewModel.getTrackName()
        }
    }
    
}
