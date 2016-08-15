//
//  User+CoreDataProperties.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/15.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var userid: String?
    @NSManaged var username: String?

}
