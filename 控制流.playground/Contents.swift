//: Playground - noun: a place where people can play

import UIKit

//For-In 循环
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


for tickMark in stride(from: 3, to: 12, by: 3) {
    //从3到9 间隔是3  （3，6，9）
    print(tickMark)
}

for tickMark in stride(from: 3, through: 12, by: 3) {
    //从3到12 间隔是3  （3，6，9，12）
    print(tickMark)
}


//Repeat-While
//while循环的另外一种形式是repeat-while，它和while的区别是在判断循环条件之前，先执行一次循环的代码块。然后重复循环直到条件为false

var whileIndex = 10
var wi = 1
repeat {
    print("测试会不会执行一次")
   wi += 1
} while wi > whileIndex


//Switch
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// 输出 "The letter A
//区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
//元组
//元组中的元素可以是值，也可以是区间。另外，使用下划线（_）来匹配所有可能的值。
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
//值绑定（Value Bindings）
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
//Where
//case 分支的模式可以使用where语句来判断额外的条件。
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//控制转移语句
//贯穿
var age = 30
switch age {
case 30:
    print("age is 30")
    fallthrough
case 1...30:
    print("age is in 1~30")
default:
    print("age is missing")
}
//没有fallthrough匹配到第一个跳出switch

//带标签的语句
//显式地指明break语句想要终止的是哪个循环体或者条件语句，如果你有许多嵌套的循环体，显式指明continue语句想要影响哪一个循环体
gameLoop: while age == 30 {

    switch age {
    case 1...30:
        print("case 1...30")
        break gameLoop
    case 30:
        print("case 30")
        continue gameLoop
    default:
        break
    }
}
print("gameLoop over")


//检测 API 可用性
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}
if #available(iOS 11, *) {
    
}
