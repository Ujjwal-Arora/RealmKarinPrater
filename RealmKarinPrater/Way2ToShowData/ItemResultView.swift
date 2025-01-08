//
//  ItemResultView.swift
//  RealmKarinPrater
//
//  Created by Ujjwal Arora on 09/01/25.
//

import RealmSwift
import SwiftUI

struct ItemResultView: View {
    
    @ObservedResults(ItemModel.self) var items
    @ObservedResults(ItemModel.self , filter: NSPredicate(format: "name CONTAINS[c] %@", "y")) var filteredItems
    @ObservedResults(ItemModel.self, sortDescriptor: SortDescriptor.init(keyPath: "name", ascending: false)) var sortedItems
    
    @State private var searchText = ""
    @State private var isAtoZ = true
    
    var body: some View {
        List{
            Toggle("Sort oreder ascending", isOn: $isAtoZ.animation())
            
            ItemSectionView(title : "all")
            
            ItemSectionView(title : "sorted and filtered", searchText : searchText, isAtoZ : isAtoZ)
        }
        .searchable(text: $searchText.animation())
    }
}

#Preview {
    ItemResultView()
}
struct ItemSectionView : View {
    //@ObservedResults is similar to @State here
    @ObservedResults(ItemModel.self) var items
    let title : String
    init(title : String,searchText : String = "", isAtoZ : Bool = true){
        self.title = title
        if searchText.isEmpty{
            self._items = ObservedResults(ItemModel.self, sortDescriptor: SortDescriptor.init(keyPath: "name", ascending: isAtoZ))
        }else{
            self._items = ObservedResults(ItemModel.self, filter: NSPredicate(format: "name CONTAINS[c] %@", searchText), sortDescriptor: SortDescriptor.init(keyPath: "name", ascending: isAtoZ))
        }
    }
    var body: some View {
        Section(title) {
            ForEach(items) { item in
                ItemRow(item: item)
            }
        }
    }
}
