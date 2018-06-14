//: Playground - noun: a place where people can play

import UIKit

//赋值运算符
//与 C 语言和 Objective-C 不同，Swift 的赋值操作并不返回任何值(Swift 会编译报错 OC能编译成功)
var x = 2, y = 3
//if x = y {
//    print("x:\(x)")
//}

//NSInteger x = 1;
//NSInteger y = 2;
//
//if (x = y){
//    NSLog(@"-----%ld",x);
//}

//算术运算符
//与 C 语言和 Objective-C 不同的是，Swift 默认情况下不允许在数值运算中出现溢出情况。但是你可以使用 Swift 的溢出运算符来实现溢出运算（如 a &+ b）

var x1 = UInt.max
print("x1:\(x1)")
//x1 = x1 + 1  \\报错
x1 = x1 &+ 1

//求余
9 % 4
9 % -4
-9 % 4
-9 % -4

//比较运算符
//注意： Swift 也提供恒等（===）和不恒等（!==）这两个比较符来判断两个对象是否引用同一个对象实例
//注意：Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符。


//空合运算符  a != nil ? a! : b
let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 非空，因此 colorNameToUse 的值为 "green"

//闭区间运算符
for index in 1...5 {
    print("\(index)")
}
print("\n")
//半开区间运算符
for index in 1..<5 {
    print("\(index)")
}
print("\n")
//单侧区间
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[2...] {
    print(name)
}
print("\n")
for name in names[..<1] {
    print(name)
}

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-100000000)  // true
print(range)
