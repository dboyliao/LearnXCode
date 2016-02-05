// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Game.swift instead.

import CoreData

public enum GameAttributes: String {
    case attempts = "attempts"
    case completions = "completions"
    case interceptions = "interceptions"
    case ourScore = "ourScore"
    case ourTeam = "ourTeam"
    case theirScore = "theirScore"
    case theirTeam = "theirTeam"
    case touchdowns = "touchdowns"
    case whenPlayed = "whenPlayed"
    case yards = "yards"
}

public enum GameRelationships: String {
    case passer = "passer"
}

@objc public
class _Game: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Game"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Game.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var attempts: NSNumber?

    // func validateAttempts(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var completions: NSNumber?

    // func validateCompletions(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var interceptions: NSNumber?

    // func validateInterceptions(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var ourScore: NSNumber?

    // func validateOurScore(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var ourTeam: String?

    // func validateOurTeam(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var theirScore: NSNumber?

    // func validateTheirScore(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var theirTeam: String?

    // func validateTheirTeam(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var touchdowns: NSNumber?

    // func validateTouchdowns(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var whenPlayed: NSDate?

    // func validateWhenPlayed(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var yards: NSNumber?

    // func validateYards(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var passer: Passer?

    // func validatePasser(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

