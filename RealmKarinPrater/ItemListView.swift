//
//  ItemListView.swift
//  RealmKarinPrater
//
//  Created by Ujjwal Arora on 08/01/25.
//

import RealmSwift
import SwiftUI

struct ItemListView: View {
    @ObservedRealmObject var group: GroupModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(group.items) { item in
                    NavigationLink(value: item) {
                        ItemRow(item: item)
                    }
                }
                .onMove(perform: $group.items.move)
                .onDelete(perform: $group.items.remove)
                .navigationDestination(for: ItemModel.self) { item in
                    ItemDetailView(item: item)
                }

            }
            .navigationBarItems(trailing: EditButton())
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        $group.items.append(ItemModel())
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ItemRow: View {
    @ObservedRealmObject var item: ItemModel

    var body: some View {
        HStack {
            Text(item.name)
            if item.isFavorite {
                Image(systemName: "heart.fill")
            }
        }
    }
}
