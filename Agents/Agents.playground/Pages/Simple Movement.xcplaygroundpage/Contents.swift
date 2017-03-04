//: [Previous](@previous) / [Next](@next)
//: # Simple Movement
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## 8-way movement
 
 Generate a random number with eight possible values.
 
 Based on the number selected, move in that direction.
 
 The more iterations of the loop, the further the agent travels.
 
 */

// Create canvas
let canvas = Canvas(width: 300, height: 300)

// No borders
canvas.drawShapesWithBorders = false

// Declare constants
let north = 0
let northEast = 1
let east = 2
let southEast = 3
let south = 4
let southWest = 5
let west = 6
let northWest = 7

// Set the step size (travel distance per iteration)
let stepSize = 5

// Set the pixel size
let diameter = 7

// Generate a starting position
var x = random(from: 50, toButNotIncluding: canvas.width - 50)
var y = random(from: 50, toButNotIncluding: canvas.height - 50)

// Travel 500 steps
for _ in 1...500 {
    
    // Generate a random direction
    var direction = random(from: 0, toButNotIncluding: 8)
    
    // Reverse direction if edge reached
    if x + stepSize > canvas.width {
        direction = west
    }
    if x - stepSize < 0 {
        direction = east
    }
    if y + stepSize > canvas.height {
        direction = south
    }
    if y - stepSize < 0 {
        direction = north
    }
    
    // Change position based on direction and step size
    if direction == north {
        y = y + stepSize
    } else if direction == northEast {
        x = x + stepSize
        y = y + stepSize
    } else if direction == east {
        x = x + stepSize
    } else if direction == southEast {
        x = x + stepSize
        y = y - stepSize
    } else if direction == south {
        y = y - stepSize
    } else if direction == southWest {
        x = x - stepSize
        y = y - stepSize
    } else if direction == west {
        x = x - stepSize
    } else if direction == northWest {
        x = x - stepSize
        y = y + stepSize
    }
    
    // Draw the agent in it's new position
    canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 25)
    canvas.drawEllipse(centreX: x, centreY: y, width: diameter, height: diameter)
}

/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView
