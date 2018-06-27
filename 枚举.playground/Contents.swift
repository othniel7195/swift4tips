//: Playground - noun: a place where people can play

import UIKit

//枚举语法
enum SomeEnumeration {
    // 枚举定义放在这里
}
//注意:与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的CompassPoint例子中，north，south，east和west不会被隐式地赋值为0，1，2和3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的CompassPoint类型。
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
Planet.venus
var pet = Planet.venus
pet = .mars

enum CompassPoint {
    case north
    case south
    case east
    case west
}
var directionHead = CompassPoint.north
switch directionHead {
case .north:
    print("north")
case .south:
    print("south")
default:
    print("other")
}

//关联值
enum BarCode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarCode = BarCode.upc(100, 20, 11, 1000)
productBarCode = .qrCode("AWERcdT6789")


switch productBarCode {
case .upc(let a, let b, let c, let d):
    print("UPC:\(a)-\(b)-\(c)-\(d)")
case .qrCode(let s):
    print("QRCODE:\(s)")
default:
    break
}
//如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个let或者var
switch productBarCode {
case let .upc(a, b, c, d):
    print("UPC:\(a)-\(b)-\(c)-\(d)")
case var .qrCode(s):
    print("QRCODE:\(s)")
default:
    break
}

//原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
//注意:原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。

//原始值的隐式赋值
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}//在上面的例子中，Plant.mercury的显式原始值为1，Planet.venus的隐式原始值为2，依次类推


//使用原始值初始化枚举实例
let asciiCC = ASCIIControlCharacter.init(rawValue: "\n")
let p2 = Planet2(rawValue: 2)
let p2test = Planet2(rawValue: 100)
let p3test = Planet2.init(rawValue: 100)

//递归枚举
enum ArithmeticExpression {
    case num(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.num(5)
let six = ArithmeticExpression.num(6)
let sum = ArithmeticExpression.addition(five, six)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.num(2))

func how_much(_ value: ArithmeticExpression) -> Int {
    
    switch value {
    case .num(let v):
        return v
    case let .addition(left , right):
        return how_much(left) + how_much(right)
    case .multiplication(let left, let right):
        return how_much(left) * how_much(right)
    }
}

let v = how_much(product)
