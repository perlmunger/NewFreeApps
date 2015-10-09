// Playground - noun: a place where people can play

import UIKit

// Optionals

func getSomeOptionalObject() -> AnyObject? {
    return "Hello World"
}

var obj: AnyObject? = getSomeOptionalObject()
obj!





// Arrays

var legacy = NSMutableArray()
legacy.addObject("orange")
legacy.addObject("blue")
legacy.addObject("green")
legacy.addObject("yellow")


let shiny:[String] = ["orange", "blue", "green", "yellow"]
//shiny.append("orange")
//shiny.append("blue")
//shiny.append("green")
//shiny.append("yellow")
shiny

// Objective-C way
var sorted = (shiny as NSArray).sortedArrayUsingDescriptors([NSSortDescriptor(key: "self", ascending: true)])
sorted

// Sort alpha
var newSorted = shiny.sort({ $0.characters.count < $1.characters.count })
newSorted


// Filter with Objective-C
var filtered = (shiny as NSArray).filteredArrayUsingPredicate(NSPredicate(format: "self contains[cd] %@", "o"))

// Filter
var filtered2 = shiny.filter({($0 as NSString).containsString("o")})
filtered2

class CustomClass {
    var color:String
    
    init(color:String) {
        self.color = color
    }
}

func >(custom1:CustomClass, custom2:CustomClass) -> Bool{
    return custom1.color.characters.count > custom1.color.characters.count
}

var c = "color"
var cc = CustomClass(color: "blue")

// Shortcut array creation
var objects = [CustomClass(color: "orange"),
    CustomClass(color: "blue"),
    CustomClass(color: "green"),
    CustomClass(color: "yellow")]

var filtered75 = objects.filter({$0.color == "blue"})
filtered75[0]

objects.sort(>)
objects

var strings = "orange,blue,green,yellow".componentsSeparatedByString(",")
strings
strings.sort({ $0 < $1 })
strings

// Dynamic Object Creation
func createLayerOfType(clazz:CALayer.Type) -> CALayer {
    
    // Create a layer dynamically
    let layer = clazz.init()
    
    // We know that all layers share a common base set of properties
    layer.bounds = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0)
    layer.position = CGPoint(x: 100.0, y: 100.0)
    layer.backgroundColor = UIColor.blueColor().CGColor
    layer.borderColor = UIColor.darkGrayColor().CGColor
    layer.borderWidth = 4.0
    layer.cornerRadius = 12.0
    
    if layer is CAGradientLayer {
        // Let's say our type is a Gradient Layer
        // Typecast this local variable
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.orangeColor().CGColor as AnyObject, UIColor.yellowColor().CGColor as AnyObject]
    } else if layer is CAShapeLayer {
        // Let's say our type is a Shape Layer
        // Typecast this local variable
        let shapeLayer = layer as! CAShapeLayer
        shapeLayer.path = UIBezierPath(rect: layer.bounds).CGPath
    } else if layer is CATextLayer {
        // Let's say our type is a Text Layer
        // Typecast this local variable
        let textLayer = layer as! CATextLayer
        textLayer.string = "Hello World!"
    }
    
    return layer
}

var gradientLayer = createLayerOfType(CAGradientLayer.self)
(gradientLayer as! CAGradientLayer).colors!.count

var shapeLayer = createLayerOfType(CAShapeLayer.self)
(shapeLayer as! CAShapeLayer).path

var textLayer = createLayerOfType(CATextLayer.self)
(textLayer as! CATextLayer).string
