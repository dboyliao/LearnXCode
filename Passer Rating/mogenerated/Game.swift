import Foundation

@objc(Game)
public class Game: _Game {

	// Custom logic goes here.
    
    var passerRating:Double {
        return passer_rating(Int(self.completions!),
                             attempts: Int(self.attempts!),
                             yards: Int(self.yards!),
                             touchdowns: Int(self.touchdowns!),
                             interceptions: Int(self.interceptions!))
    }
}
