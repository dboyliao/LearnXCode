// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Passer.swift instead.

import CoreData

public enum PasserAttributes: String {
    case currentTeam = "currentTeam"
    case firstName = "firstName"
    case lastName = "lastName"
}

public enum PasserRelationships: String {
    case games = "games"
}

@objc public
class _Passer: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Passer"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Passer.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var currentTeam: String?

    // func validateCurrentTeam(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var firstName: String?

    // func validateFirstName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var lastName: String?

    // func validateLastName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var games: NSSet

}

extension _Passer {

    func addGames(objects: NSSet) {
        let mutable = self.games.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.games = mutable.copy() as! NSSet
    }

    func removeGames(objects: NSSet) {
        let mutable = self.games.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.games = mutable.copy() as! NSSet
    }

    func addGamesObject(value: Game!) {
        let mutable = self.games.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.games = mutable.copy() as! NSSet
    }

    func removeGamesObject(value: Game!) {
        let mutable = self.games.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.games = mutable.copy() as! NSSet
    }

}

