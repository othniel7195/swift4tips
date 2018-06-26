//: Playground - noun: a place where people can play

import UIKit


func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
//注意严格上来说，虽然没有返回值被定义，greet(person:) 函数依然返回了值。没有定义返回类型的函数会返回一个特殊的Void值。它其实是一个空的元组（tuple），没有任何元素，可以写成()。

//可选元组返回类型
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//可选绑定来检查 minMax(array:) 函数返回的是一个存在的元组值还是 nil
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

//函数参数标签和参数名称
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}

//指定参数标签
//你可以在参数名称前指定它的参数标签，中间以空格分隔：

func someFunction(argumentLabel parameterName: Int) {
    // 在函数体内，parameterName 代表参数值
}

//忽略参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(1, secondParameterName: 2)

func someFunction2(_: Int){
    print("some function2")
}
someFunction2(2)

//可变参数
//一个函数最多只能拥有一个可变参数。
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

//输入输出参数
//函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误(compile-time error)。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


//使用函数类型
func t1(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func t2(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var myFunction:(Int, Int) -> Int = t1
print("myFunction:\(myFunction(3,4))")

myFunction = t2
print("myFunction:\(myFunction(3,4))")

//函数类型作为参数类型
func t3(_ myFunction2: (Int, Int) -> Int, _ a: Int, _ b: Int) -> Int {
    
    return myFunction2(a,b)
}

print("测试1:\(t3(t1,1,15))")
print("测试2:\(t3(t2,4,5))")

//函数类型作为返回类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: true)
moveNearerToZero(currentValue)

//嵌套函数
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward2(_ input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward2(_ input: Int) -> Int {
        return input - 1
    }
    
    return backward ? stepBackward2 : stepForward2
}

let moveNearerToZero2 = chooseStepFunction2(backward: true);
moveNearerToZero2(5)
