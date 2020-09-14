//
//  ContentView.swift
//  Yugioh
//
//  Created by Aleksandar on 14/09/2020.
//  Copyright © 2020 Aleksandar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetcher = DuelistFetcher()
    
    var body: some View {
        NavigationView{
        List {
            ForEach(fetcher.duelists) {
                duelist in
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
      }.navigationBarTitle(Text("Duelists"))
    }
  }
 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
