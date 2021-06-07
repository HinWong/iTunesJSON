//
//  ViewController.swift
//  GMCodingChallenge
//
//  Created by Hin Wong on 6/4/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var artistSearchTextField: UITextField!
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchArtistButton(_ sender: UIButton) {
        guard let musicLookup = artistSearchTextField.text, !musicLookup.isEmpty else { return }
        addSpinnerView()
        NetworkManager.fetchMusic(searchTerm: musicLookup) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let response):
                    let sb = UIStoryboard(name: "Artist", bundle: nil)
                    guard let vc = sb.instantiateViewController(identifier: "ArtistDetailVC") as? ArtistDetailViewController else { return }
                    vc.musicVM = MusicViewModel(musicResponse: response)
                    self?.removeSpinnerView()
                    self?.navigationController?.pushViewController(vc, animated: true)
                case .failure(let error):
                    print(error, error.localizedDescription)
                }
            }
        }
        
    }
    
} //End of class

