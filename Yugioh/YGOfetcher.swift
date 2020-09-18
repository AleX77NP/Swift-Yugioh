//
//  YGOfetcher.swift
//  Yugioh
//
//  Created by Aleksandar on 14/09/2020.
//  Copyright © 2020 Aleksandar. All rights reserved.
//

import Foundation
import SwiftUI

struct Duelist: Identifiable, Decodable, Equatable {
    let id: Int
    let name: String
    let age: Int
    let deck: String
    let ace: String
    let img: String
    let biography: String
}

class DuelistFetcher: ObservableObject {
    
    @Published var duelists = [Duelist]()
    @Published var favorites = [Duelist]()
    @Published var loaded = false

    init() {
        fetchAll()
    }
    
    func fetchAll() {
        let url = URL(string: "https://acomanketa.000webhostapp.com/yugioh.json")!
        URLSession.shared.self.dataTask(with: url) {
            (data, response, error) in
            do {
                let tempData = try JSONDecoder().self.decode([Duelist].self, from: data!)
                DispatchQueue.main.async {
                    sleep(1)
                    self.duelists = tempData
                    self.favorites = tempData.filter {$0.id < 4}
                    self.loaded = true
                  //  print(self.duelists)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
