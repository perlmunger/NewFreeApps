// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EntryMO.swift instead.

import CoreData

enum EntryMOAttributes: String {
    case id = "id"
    case imageLink = "imageLink"
    case link = "link"
    case releaseDate = "releaseDate"
    case rights = "rights"
    case title = "title"
}

@objc
class _EntryMO: BaseManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Entry"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _EntryMO.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var id: String?

    // func validateId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var imageLink: String?

    // func validateImageLink(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var link: String?

    // func validateLink(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var releaseDate: NSDate?

    // func validateReleaseDate(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var rights: String?

    // func validateRights(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var title: String?

    // func validateTitle(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

}

