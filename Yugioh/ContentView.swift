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
    @State var favorites = [Duelist]()
    @State var isOn: Bool = false
    
    var body: some View {
        NavigationView{
        List {
            Toggle("Hide duelists",isOn: $isOn)
            ForEach(!isOn ? fetcher.duelists : favorites) {
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
    func isFavorite(duelist: Duelist) -> Bool {
        return self.favorites.contains(duelist) ? true : false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
