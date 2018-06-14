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

