//
//  ListItem.swift
//  Yugioh
//
//  Created by Aleksandar on 19/09/2020.
//  Copyright © 2020 Aleksandar. All rights reserved.
//

import Foundation
import SwiftUI

struct ListItemDuelist: View {
    var duelist: Duelist
    
    var body: some View {
        NavigationLink(destination: DuelistView(duelist: duelist)) {
    HStack{
        Image(duelist.img)
        .resizable()
            .frame(width: 50, height: 50, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 2.0))
            
        VStack {
            Text(duelist.name).font(.headline)
            Text("Age: " + String(duelist.age)).font(.subheadline)
        }
      }
    }
  }
}
