//
//  ItemModel.swift
//  RealmKarinPrater
//
//  Created by Ujjwal Arora on 08/01/25.
//

import RealmSwift
import Foundation

//models are classes and not structs in realm
class ItemModel : Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var _id : ObjectId //why _id
    @Persisted var name = "\(randomAdjectives.randomElement() ?? "cutie") \(randomNouns.randomElement() ?? "ujju")"
    @Persisted var isFavorite : Bool = false
    
    @Persisted(originProperty: "items") var group : LinkingObjects<GroupModel>
}
let randomAdjectives = [
    "fluffy,","soft,","shiny,","glistening,","golden,","silver,","blue,","red,","green,","purple,","black,","white,","brown,","yellow,","orange"
    ]
let randomNouns = [
    "floor","monitor","table","chair","door","window","keyboard","mouse","computer","phone"
    ]
