//
//  ContentView.swift
//  HAXOR
//
//  Created by Cameron Mundorff on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
        .navigationBarTitle("H4XOR NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
   // Post(id: "1", title: "Hello"),
   // Post(id: "2", title: "Bonjour"),
   // Post(id: "3", title: "Hola")
//]
