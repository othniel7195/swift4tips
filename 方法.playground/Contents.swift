//: Playground - noun: a place where people can play

import UIKit

//self 属性
//类型的每一个实例都有一个隐含属性叫做self，self完全等同于该实例本身。你可以在一个实例的实例方法中使用这个隐含的self属性来引用当前实例
//实际上，你不必在你的代码里面经常写self。不论何时，只要在一个方法中使用一个已知的属性或者方法名称，如果你没有明确地写self，Swift 假定你是指当前实例的属性或者方法


//self消除方法参数x和实例属性x之间的歧义
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}



//在实例方法中修改值类型
//结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改
//关键字mutating 放到方法的func关键字之前就可以了：

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point2(x: 1.0, y: 1.0)
somePoint.moveByX(deltaX: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

//注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性
//let fixedPoint = Point2(x: 3.0, y: 3.0) //error: change 'let' to 'var' to make it mutable
//fixedPoint.moveByX(2.0, y: 3.0)


//在可变方法中给 self 赋值
//可变方法能够赋给隐含属性self一个全新的实例

struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}
var somePoint3 = Point3(x: 1.0, y: 1.0)
somePoint3.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint3.x), \(somePoint3.y))")


//枚举的可变方法可以把self设置为同一枚举类型中不同的成员
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight 现在等于 .High
ovenLight.next()
// ovenLight 现在等于 .Off



//类型方法
//在方法的func关键字之前加上关键字static，来指定类型方法。类还可以用关键字class来允许子类重写父类的方法实现

//注意
//在 Objective-C 中，你只能为 Objective-C 的类类型（classes）定义类型方法（type-level methods）。在 Swift 中，你可以为所有的类、结构体和枚举定义类型方法。每一个类型方法都被它所支持的类型显式包含


class SomeOneClass {
    
    static func someOneDo(){
        print("some one do")
    }
    
    class func someOneToDo(){
        print("some one to do")
    }
}

SomeOneClass.someOneDo()
SomeOneClass.someOneToDo()

class SomeTwoClass : SomeOneClass{
    
//    static override func  someOneDo(){
//        print("some two do")
//    }
    class override func someOneToDo(){
        print("some two to do")
    }
}

SomeTwoClass.someOneToDo()



struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    //结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改
    //关键字mutating 放到方法的func关键字之前就可以了
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// 打印 "highest unlocked level is now 2"

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// 打印 "level 6 has not yet been unlocked"
