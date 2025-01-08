//
//  GroupModel.swift
//  RealmKarinPrater
//
//  Created by Ujjwal Arora on 08/01/25.
//

import RealmSwift
import Foundation

final class GroupModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id  : ObjectId
    @Persisted var items = RealmSwift.List<ItemModel>()
}
