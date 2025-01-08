//
//  ItemDetailView.swift
//  RealmKarinPrater
//
//  Created by Ujjwal Arora on 08/01/25.
//

import RealmSwift
import SwiftUI

struct ItemDetailView: View {
    
    //@observedObject / @Binding =>
    @ObservedRealmObject var item : ItemModel
    
    var body: some View {
        VStack(alignment : .leading){
            Text("Enter a new name")
            TextField("New name", text: $item.name)
                .textFieldStyle(.roundedBorder)
            
            Button("Delete") {
                
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle(item.name)
        .navigationBarItems(trailing: Toggle(isOn: $item.isFavorite, label: {
            Image(systemName: item.isFavorite ? "heart.fill" : "heart")
        }))
        .padding()
    }
}

#Preview {
    NavigationStack {
        ItemDetailView(item: ItemModel())
    }
}
