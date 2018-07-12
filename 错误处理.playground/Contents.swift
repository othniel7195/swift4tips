//: Playground - noun: a place where people can play

import UIKit

//表示并抛出错误
enum TESTError: Error {
    case TOneError
    case TTwoError(needSome: Int)
    case TThreeError
}
//throw TESTError.TTwoError(needSome: 10)


//注意:Swift 中的错误处理和其他语言中用try，catch和throw进行异常处理很像。和其他语言中（包括 Objective-C ）的异常处理不同的是，Swift 中的错误处理并不涉及解除调用栈，这是一个计算代价高昂的过程。就此而言，throw语句的性能特性是可以和return语句相媲美的。


//func canThrowErrors() throws -> String
//注意
//只有 throwing 函数可以传递错误。任何在某个非 throwing 函数内部抛出的错误只能在函数内部处理。



//用 Do-Catch 处理错误
//do {
//    try expression
//    statements
//} catch pattern 1 {
//    statements
//} catch pattern 2 where condition {
//    statements
//}




//将错误转换成可选值
//可以使用try?通过将错误转换成一个可选值来处理错误。如果在评估try?表达式时一个错误被抛出，那么表达式的值就是nil。例如，在下面的代码中，x和y有着相同的数值和等价的含义：
//
//func someThrowingFunction() throws -> Int {
//    // ...
//}
//
//let x = try? someThrowingFunction()
//
//let y: Int?
//do {
//    y = try someThrowingFunction()
//} catch {
//    y = nil
//}
//如果someThrowingFunction()抛出一个错误，x和y的值是nil。否则x和y的值就是该函数的返回值。注意，无论someThrowingFunction()的返回值类型是什么类型，x和y都是这个类型的可选类型




//禁用错误传递
//有时你知道某个throwing函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写try!来禁用错误传递，这会把调用包装在一个不会有错误抛出的运行时断言中。如果真的抛出了错误，你会得到一个运行时错误。


//指定清理操作
//可以使用defer语句在即将离开当前代码块时执行一系列语句。该语句让你能执行一些必要的清理工作，不管是以何种方式离开当前代码块的——无论是由于抛出错误而离开，或是由于诸如return、break的语句。例如，你可以用defer语句来确保文件描述符得以关闭，以及手动分配的内存得以释放。

print("===========")

var t = 10
if t < 20 {
    defer {
        print("清理")
    }
    t = t * 2
    print("t:\(t)")
    
    
}
