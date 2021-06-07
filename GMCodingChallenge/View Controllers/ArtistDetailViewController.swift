//
//  ArtistDetailViewController.swift
//  GMCodingChallenge
//
//  Created by Hin Wong on 6/4/21.
//

import UIKit

class ArtistDetailViewController: UIViewController {


    @IBOutlet weak var artistDetailsTable: UITableView!
    
    var musicVM: MusicViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        artistDetailsTable.delegate = self
        artistDetailsTable.dataSource = self
        let nib = UINib(nibName: MusicCell.identifier, bundle: nil)
        artistDetailsTable.register(nib, forCellReuseIdentifier: MusicCell.identifier)
    }

}

extension ArtistDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(musicVM?.getNumberOfResults() ?? 0)
        return musicVM?.getNumberOfResults() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = artistDetailsTable.dequeueReusableCell(withIdentifier: MusicCell.identifier) as? MusicCell,
            let musicDetails = musicVM?.resultsInformation?.results[indexPath.row]
              else {
            return UITableViewCell()
        }
    
        let cellVM = MusicDetailsVM(musicDetails: musicDetails)
        cell.configure(viewModel: cellVM)
        
        ImageCache.shared.loadImage(from: cellVM.getImageUrl() ?? "") { image in
            if let visibleCell = tableView.cellForRow(at: indexPath) as? MusicCell {
                visibleCell.musicImageView.image = image
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
