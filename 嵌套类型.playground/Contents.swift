//: Playground - noun: a place where people can play

import UIKit

//嵌套类型实践

struct MyCard{
    
    enum MyType: Int {
        case MyTypeOne
        case MyTypeTwo
    }
    
    enum MyStruct: Int {
        case MyStructOne = 2, MyStructTwo, MyStructThree
        case MyStructFour, MyStructFive
        struct MyStructSix{
            let first:Int?,second:Int?
        }
    }
    
}


let myCard = MyCard.MyType.MyTypeOne
let myCard2 = MyCard.MyStruct.MyStructThree.rawValue
let myCard3 = MyCard.MyStruct.MyStructSix.init(first: 2, second: 4)
myCard3.first
myCard3.second
