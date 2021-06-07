//
//  HomeViewController+Spinner.swift
//  GMCodingChallenge
//
//  Created by Hin Wong on 6/4/21.
//

import Foundation

extension HomeViewController {
    func addSpinnerView() {
        DispatchQueue.main.async {
            self.spinner.startAnimating()
            self.view.addSubview(self.spinner)
            self.spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        
    }
    func removeSpinnerView() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
        }
    }
}
