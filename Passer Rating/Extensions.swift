//
//  Extensions.swift
//  Passer Rating
//
//  Created by DboyLiao on 2/4/16.
//  Copyright © 2016 dboyliao. All rights reserved.
//

import UIKit
import CoreData
import Foundation


/************************** NSIndexPath ***************************/
 
 /** Generate an index path from a series of indices.
 It can’t be mad a convenience initializer, because
 the process requires a new index path at each step,
 and Swift initializers can't substitute self.
 */

extension NSIndexPath {
    class func variadicPath(indices: Int ...)
        -> NSIndexPath {
            var retval = NSIndexPath()
            for index in indices {
                retval = retval.indexPathByAddingIndex(index)
            }
            return retval
    }
}

/******************* NSFetchedResultsController *******************/
 
 /** Add subscripts to NSFetchedResultsController.
 
 The operators in this extension make it easy to retrieve sections
 and managed objects by index path.
 */
extension NSFetchedResultsController {
    
    /** Return a managed object given an index path.
     
     :bug: Does not check that the index path is of the
     correct arity, nor that all items are in-bounds.
     If these aren't true, NSFetchedResultsController
     will raise an exception. In this application,
     the operator is used only when driven by a table
     view, which guarantees the path is valid.
     */
    subscript (indexPath: NSIndexPath) -> NSManagedObject {
        return self.objectAtIndexPath(indexPath) as! NSManagedObject
    }
    
    /** Return a managed object given section and row numbers.
     Implemented through subscript(NSIndexPath) -> NSManagedObject.
     
     :bug: See subscript(NSIndexPath) for bounds issues.
     */
    subscript (section: Int, row: Int) -> NSManagedObject {
        let indexPath = NSIndexPath(forRow: row, inSection: section)
        return self[indexPath]
    }
}


/******************* UITableView *******************/
 
 /** Add subscripts to retrieve a table-view cell by path or section+row.
 */
extension UITableView {
    
    /** Return a table-view cell given an index path.
     
     :bug: Should check the arity (2) of the path.
     :bug: Does not handle the exception raised for indices
     out of range.
     */
    subscript (indexPath: NSIndexPath) -> UITableViewCell {
        return self.cellForRowAtIndexPath(indexPath)!
    }
    
    /** Return a table-view cell given section and row.
     Implemented through self.cellForRowAtIndexPath.
     
     :bug: Could bounds-check the section and row, but does
     not.
     */
    subscript (section: Int, row: Int) -> UITableViewCell {
        let indexPath = NSIndexPath(forRow: row, inSection: section)
        return self.cellForRowAtIndexPath(indexPath)!
    }
}

/******************* String *******************/

extension String {
    /// Break the receiver at line endings and return
    /// the lines in an array of String.
    func brokenByLines() -> [ String ]
    {
        let scanner = NSScanner(string: self)
        let lineEnders = NSCharacterSet.newlineCharacterSet()
        var retval = [String]()
        
        scanner.charactersToBeSkipped = nil
        while !scanner.atEnd {
            var token: NSString? = ""
            scanner.scanCharactersFromSet(lineEnders,
                intoString: nil)
            var success: Bool
            success = scanner.scanUpToCharactersFromSet(lineEnders,
                intoString: &token)
            if success {
                retval.append(token as String!)
            }
        }
        return retval
    }
}