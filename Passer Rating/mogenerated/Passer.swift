import Foundation

@objc(Passer)
public class Passer: _Passer {

	// Custom logic goes here.
    
    func sumOfGameAttribute(attribute: String) -> Int {
        let keyPath = "@sum.\(attribute)"
        return self.games.valueForKeyPath(keyPath) as! Int
    }
    
    var attempts: Int {
        return sumOfGameAttribute("attempts")
    }
    
    var completions:Int {
        return sumOfGameAttribute("completions")
    }
    
    var yards:Int {
        return sumOfGameAttribute("yards")
    }
    
    var touchdowns:Int {
        return sumOfGameAttribute("touchdowns")
    }
    
    var interceptions:Int {
        return sumOfGameAttribute("interceptions")
    }
    
    var firstPlayed: NSDate {
        return self.games.valueForKeyPath("@min.whenPlayed") as! NSDate
    }
    
    var lastPlayed: NSDate {
        return self.games.valueForKeyPath("@max.whenPlayed") as! NSDate
    }
    
    var teams:[String] {
        let theGames:AnyObject = self.games.valueForKeyPath("@distinctUnionOfObjects.ourTeam")!
        
        return theGames.allObjects as! [String]
    }
}
