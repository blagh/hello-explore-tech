//: Hello Explore Tech!
// These are just some neat little Swift things
// Also check out the Swift tour from Apple:
// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html

//: Static types 
// can be ommitted if they can be inferred
var thing1 = 5   // infers the Int type (you won't be able to assign e.g. a String afterwards)
var thing2: Int  // integer, must be initialized before use, will never be nil

//: Internal and external function arguments
//   they are always positional!
func fizzBuzz(to max: Int) {
    for i in 1...max {
        if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
}
fizzBuzz(to: 16)

//: Nullable types
var stringString: String? = nil         // this String _could_ be nil
print(stringString?.lowercased() ?? "") //

// you can also do stuff like
if let stringString = stringString {
    // this block will not be entered if stringString is nil
    // and stringString will be non-optional
    print(stringString.lowercased())
}

// A small point of caution: retain cycles
// If both Thing1.thing2 and Thing2.thing1 are not declared weak
// then the deinitializer is never called

class Thing1 {
    // fix the retain cycle by changing this reference to `weak var thing2`
    var thing2: Thing2? = nil

    init() {
        print("Thing1 initialized!")
    }
    deinit {
        print("Thing1 deinitialized!")
    }
}

class Thing2 {
    var thing1: Thing1? = nil

    init() {
        print("Thing2 initialized!")
    }
    deinit {
        print("Thing2 deinitialized!")
    }
}

var newThing1: Thing1? = Thing1()
var newThing2: Thing2? = Thing2()
newThing1?.thing2 = newThing2
newThing2?.thing1 = newThing1

newThing1 = nil
newThing2 = nil
// the retain cycle is fixed when you see the
// deinitialization messages in the log output

