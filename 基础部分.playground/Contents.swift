//: Playground - noun: a place where people can play

import UIKit

//常量
let maximumNumberOfLoginAttempts = 10
//变量
var currentLoginAttempt = 10
//类型标注
var welcomeMessage: String = "hello"

//输出
print("pp\(welcomeMessage)")

//整数
let intType = 1000_1000
print(intType)

//元祖
let tupe = (404,"ERROR")
print(tupe.0)
print(tupe.1)
let (status,_) = tupe
print("status \(status)")
let tupe1 = (state:408,msg:"NEW ERROR")
print(tupe1.msg)
//类型别名
typealias newInt = Int
var newMin = newInt.min
//可选类型
let possibleNumber = "什么鬼"
let convertedNumber = Int(possibleNumber)
var newString:String? = "神马"
newString!

//可选绑定
if let i1 = Int("123"){
 
    if let i2 = Int("神马") {
        print("i2:\(i2)")
    }else{
        print("i1:\(i1) 无法获取i2")
    }
}

enum NewError : Error{
    case OneError
    case twoError
}

func exitGuard(){
    guard let i3 = Int("什么") else{
        print("else 中无法获取i3，并且要个退出else作用域的方法")
        return
    }
    print("i1:\(i3)")
}


exitGuard()

//隐式解析可选类型
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值
let assumedString: String! = "An implicitly unwrapped optional string."
print(forcedString)
let implicitString: String = assumedString  // 不需要感叹号

//错误处理
func doError() throws {
    throw NewError.OneError
}

do {
    try doError()
    print("do Error no error")
} catch NewError.twoError {
    print("do Error is two error")
} catch NewError.OneError {
    print("do Error is one error")
}
