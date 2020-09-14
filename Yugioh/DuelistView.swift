//
//  DuelistView.swift
//  Yugioh
//
//  Created by Aleksandar on 14/09/2020.
//  Copyright © 2020 Aleksandar. All rights reserved.
//

import Foundation
import SwiftUI

struct DuelistView: View {
    
    var duelist: Duelist
    
    var body: some View {
        ScrollView {
        VStack {
            Image(duelist.img)
            .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width:180, height: 180)
                Text(duelist.name).font(.headline)
                Text("Age: " + String(duelist.age)).font(.subheadline)
                Text("Deck: " + duelist.deck).font(.subheadline)
                Text("Ace card: " + duelist.ace).font(.subheadline)
                Text("Bio: ").font(.subheadline)
                Text(duelist.biography)
                    .padding(.horizontal, 20)
        }
     }
  }
}
