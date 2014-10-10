//
//  DataManager.swift
//  NewFreeApps
//
//  Created by Matt Long on 10/9/14.
//  Copyright (c) 2014 Matt Long. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {

    var managedObjectContext:NSManagedObjectContext?
    
    class var sharedInstance : DataManager {
    struct DataManagerStruct {
        static let sharedInstance = DataManager()
        }
        return DataManagerStruct.sharedInstance
    }
    
    override init() {
        super.init()
    }
    
    func downloadFeed() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            
            var task = NSURLSession.sharedSession().dataTaskWithRequest(NSURLRequest(URL: NSURL(string: "https://itunes.apple.com/us/rss/newfreeapplications/limit=10/json")), completionHandler: { (data, response, error) -> Void in
                
                if data.length > 0 {
                    
                    var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary
                    
                    var importContext = NSManagedObjectContext()
                    importContext.persistentStoreCoordinator = self.managedObjectContext!.persistentStoreCoordinator
                    
                    var dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
                    
                    var request = NSFetchRequest(entityName: EntryMO.entityName())
                    var entryObjects = importContext.executeFetchRequest(request, error: nil) as? [EntryMO]
                    var lookup:[String:EntryMO] = [:]
                    
                    for entryObject in entryObjects! {
                        lookup[entryObject.id!] = entryObject
                    }
                    
                    if object != nil {
                        let entries = object!.valueForKeyPath("feed.entry") as? NSArray
                        
                        for entry in entries! {
                            if let entryDict = entry as? NSDictionary {
                                let id = entryDict.valueForKeyPath("id.attributes.im:id") as String
                                
                                var entryObject = lookup[id]
                                if entryObject == nil {
                                    entryObject = EntryMO(managedObjectContext: importContext)
                                }
                                let images = entryDict.valueForKeyPath("im:image") as NSArray
                                let filteredImages = images.filteredArrayUsingPredicate(NSPredicate(format: "attributes.height == %@", "75")) as NSArray
                                let imageLink = (filteredImages.lastObject as NSDictionary).valueForKeyPath("label") as? String
                                let releaseDate = entryDict.valueForKeyPath("im:releaseDate.label") as? String
                                let link = entryDict.valueForKeyPath("link.attributes.href") as? String
                                let rights = entryDict.valueForKeyPath("rights.label") as? String
                                let title = entryDict.valueForKeyPath("title.label") as? String
                                
                                entryObject!.id = id
                                entryObject!.imageLink = imageLink
                                if releaseDate != nil {
                                    entryObject!.releaseDate = dateFormatter.dateFromString(releaseDate!)
                                }
                                entryObject!.link = link
                                entryObject!.rights = rights
                                entryObject!.title = title
                                
                            }
                        }
                        
                        importContext.save(nil)

                    }
                    
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        NSNotificationCenter.defaultCenter().postNotificationName("dataDidUpdateNotification", object: nil)
                    })

                    
                }
                
            })
            task.resume()
        })
    }

}
