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
    @State var isOn: Bool = false
    
    var body: some View {
        if(fetcher.loaded) {
        NavigationView{
        List {
            Toggle("Only favorites",isOn: $isOn)
            ForEach(!isOn ? fetcher.duelists : fetcher.favorites) {
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
      }
    }.navigationBarTitle(Text("Duelists"))
  }
        } else {
            LoadingView()
        }
 }
}

struct LoadingView: View {
    @State var animate = false
    var body: some View {
        VStack {
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(AngularGradient(gradient: .init(colors: [.blue,.red]),
                                    center: .center),style: StrokeStyle(lineWidth: 8, lineCap: .round))
            .rotationEffect(.degrees(self.animate ? 360.0 : 0.0))
            .animation(self.animate ? Animation.linear(duration:
                1.0).repeatForever(autoreverses: false) : .default)
            .frame(width: 50, height: 50)
    }
        .onAppear {
            self.animate.toggle()
        }
        
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
