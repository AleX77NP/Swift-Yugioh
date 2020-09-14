//
//  YGOfetcher.swift
//  Yugioh
//
//  Created by Aleksandar on 14/09/2020.
//  Copyright © 2020 Aleksandar. All rights reserved.
//

import Foundation
import SwiftUI

struct Duelist: Identifiable, Decodable {
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
                    self.duelists = tempData
                  //  print(self.duelists)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
