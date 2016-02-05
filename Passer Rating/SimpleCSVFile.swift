//
//  SimpleCSVFile.swift
//  Passer Rating
//
//  Created by DboyLiao on 2/5/16.
//  Copyright © 2016 dboyliao. All rights reserved.
//

import Foundation

let DboyErrorDomain = "com.dboy.error"

enum CSVErrorKeys:String {
    case ErrorLine = "kCSVErrorLine"
    case ExpectedFields = "kCSVExpectFields"
    case ActualFields = "kCSVActualFieds"
}

enum CSVError {
    case LineFormat(String, Int, Int, Int)
    case EmptyFile(String)
    case NoSuchFile(String)
    case ClientError(String, Int)
    
    var code: Int {
        
        switch self {
        case .LineFormat:
            return -3
        case .EmptyFile:
            return -2
        case .NoSuchFile:
            return -1
        case .ClientError:
            return 1
        }
    }
 
    var nsError: NSError {
        var userInfo:[NSString:AnyObject] = [:]
        
        switch self {
        case .NoSuchFile(let fileName):
            userInfo = [
                NSFilePathErrorKey: fileName,
                NSLocalizedDescriptionKey: "\(fileName): No such file"
            ]
        case .EmptyFile(let fileName):
            userInfo = [
                NSFilePathErrorKey: fileName,
                NSLocalizedDescriptionKey: "\(fileName): File is empty"
            ]
        case .LineFormat(let fileName, let lineNumber, let expected, let actual):
            userInfo = [
                NSFilePathErrorKey: fileName,
                NSLocalizedDescriptionKey: "\(fileName): Line \(lineNumber) has actual \(actual) items, " + "should have \(expected).",
                CSVErrorKeys.ExpectedFields.rawValue: expected,
                CSVErrorKeys.ActualFields.rawValue: actual
            ]
        case .ClientError(let fileName, let lineNumber):
            userInfo = [
                NSFilePathErrorKey: fileName,
                NSLocalizedDescriptionKey: "\(fileName): Error occur at line \(lineNumber)"
            ]
        }
        
        return NSError(domain: DboyErrorDomain,
                       code: self.code,
                       userInfo: userInfo)
    }
}

extension String {
    
    static func fromFileOrNil(path: String) throws -> String
    {
        do {
            
            let value = try NSString(contentsOfFile: path,
                                     encoding: NSUTF8StringEncoding) as String
            return value
            
        } catch {
            
            throw NSError(domain: "Migrator", code: 0, userInfo: nil)
            
        }
    }
}

class SimpleCSVFile {
    
    let path:String
    
    init(path:String){
        self.path = path
    }
    
    var lineCount:Int = 0
    var headers:[String] = []
    var linesFromFile:[String] = []
    
    func prepareToRun() -> CSVError? {
        do {
            let maybeContents:NSString? = try NSString(contentsOfFile:self.path,
                                                     encoding: NSUTF8StringEncoding)
            
            if let realContents = maybeContents {
                if realContents.length == 0 {
                    return CSVError.EmptyFile(self.path)
                }
                self.linesFromFile = realContents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
                self.lineCount = 0
            } else {
                return CSVError.NoSuchFile(self.path)
            }
        
        } catch {}
        
        return nil
    }
    
    func run(block: ([String:String]) -> NSError?) -> CSVError?
    {
        if let error = prepareToRun() {
            return error
        }
        
        for line in linesFromFile {
            self.lineCount++
            let fields = line.componentsSeparatedByString(",")
            
            if headers.count == 0 {
                headers = fields
            } else {
                let values = NSDictionary(objects: fields,
                                          forKeys: self.headers) as! [String:String]
                
                if let _ = block(values) {
                    
                    return CSVError.ClientError(self.path, self.lineCount)
                }
            }
        }
        return nil
    }
}
