//
//  MusicViewModel.swift
//  GMCodingChallenge
//
//  Created by Hin Wong on 6/4/21.
//

import Foundation


class MusicViewModel {
    let resultsInformation: MusicResponse?
    
    init(musicResponse: MusicResponse) {
        self.resultsInformation = musicResponse
    }
    
    func getNumberOfResults() -> Int {
        resultsInformation?.resultCount ?? 0
    }
}
