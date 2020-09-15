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
    
    @State var isFav: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
            Text(duelist.name).font(.largeTitle)
          //  Divider()
            Image(duelist.img)
            .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width:200, height: 200)
                Text("Age: " + String(duelist.age)).font(.subheadline)
                Text("Deck: " + duelist.deck).font(.subheadline)
                Text("Ace card: " + duelist.ace).font(.subheadline)
               Divider()
                Text("Bio: ").font(.subheadline)
                Text(duelist.biography)
                    .padding(.horizontal, 20)
                Divider()
                HStack {
                    Text("Add to favorites? ")
                    Button(action: {
                        print("clicked")
                        self.isFav = !self.isFav
                    }) {
                        Image(systemName: !self.isFav ? "heart" : "trash")
                        .resizable()
                            .foregroundColor(.red)
                            .frame(width: 20, height: 20)
                    }
                }
        }
     }
  }
}
