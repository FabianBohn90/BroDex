//
//  PokemonDB+CoreDataProperties.swift
//  BroDex
//
//  Created by Fabian Bohn on 07.02.23.
//
//

import Foundation
import CoreData


extension PokemonDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonDB> {
        return NSFetchRequest<PokemonDB>(entityName: "PokemonDB")
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?

}

extension PokemonDB : Identifiable {

}
