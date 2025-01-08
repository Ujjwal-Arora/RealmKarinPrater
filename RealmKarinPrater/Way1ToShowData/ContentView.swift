//
//  ContentView.swift
//  RealmKarinPrater
//
//  Created by Ujjwal Arora on 08/01/25.
//

import RealmSwift
import SwiftUI

struct ContentView: View {
    @ObservedResults(GroupModel.self) var groups
    var body: some View {
        if let group = groups.first {
            ItemListView(group: group)
        }else{
            ProgressView()
                .onAppear {
                    $groups.append(GroupModel())
                }
        }
    }
}

#Preview {
    ContentView()
}
