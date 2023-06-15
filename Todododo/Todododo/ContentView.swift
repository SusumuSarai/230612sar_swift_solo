//
//  ContentView.swift
//  Todododo
//
//  Created by user on 2023/06/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            HStack{Text("☑︎")
                Text("Hello, world!")
            }
            Text("Hello, world!")
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
