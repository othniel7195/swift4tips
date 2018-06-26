//: Playground - noun: a place where people can play

import UIKit

//Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
//利用上下文推断参数和返回值类型
//隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
//参数名称缩写
//尾随闭包语法

func charsort(_ s1: String, _ s2: String) -> Bool{
    
    return s1 > s2
}
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reversedNames = names.sorted(by: charsort)

//闭包表达式语法
//{ (parameters) -> returnType in
//statements
//}

var reversedNames2 = names.sorted(by: {(_ s1: String, _ s2: String) -> Bool in return s1 > s2})
print(reversedNames2)

//根据上下文推断类型
var reversedNames3 = names.sorted(by: {s1, s2 in return s1 > s2})
print(reversedNames3)
//单表达式闭包隐式返回
var reversedNames4 = names.sorted(by: {s1, s2 in s1 > s2})
print(reversedNames4)

//参数名称缩写(参数从0开始)
var reversedNames5 = names.sorted(by: {$0 > $1})
print(reversedNames5)

//运算符方法
var reversedNames6 = names.sorted(by: >)
print(reversedNames6)

//尾随闭包
//如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性
var reversedNames7 = names.sorted(){$0 > $1}
print(reversedNames7)
//如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
var reversedNames8 = names.sorted{$0 > $1}
print(reversedNames8)


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let numberstrings = numbers.map{
    (number) -> String in
    var num = number
    var output = ""
    while num > 0 {
        //注意：字典 digitNames 下标后跟着一个叹号（!），因为字典下标返回一个可选值（optional value），表明该键不存在时会查找失败。在上例中，由于可以确定 number % 10 总是 digitNames 字典的有效下标，因此叹号可以用于强制解包 (force-unwrap) 存储在下标的可选类型的返回值中的String类型的值。
        output = digitNames[num % 10]! + output
        num /= 10
    }
    
    return output
}
print(numberstrings)


//值捕获
//闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        print("amout:\(amount)---runningTotal:\(runningTotal)")
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let makeFunction = makeIncrementer(forIncrement: 10)
makeFunction()
makeFunction()
makeFunction()

//闭包是引用类型上面的例子中，makeFunction是常量，但是这常量指向的闭包仍然可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型。


//逃逸闭包
//当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的
//当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
//一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中

var completionHandlers:[() -> Void] = []
func someFunctionAsync(completionHandler: @escaping () -> Void){
    completionHandlers.append(completionHandler)
}

var sfAsync = 1
someFunctionAsync {
   sfAsync = 100
}
completionHandlers
sfAsync
completionHandlers.first?()
sfAsync

func someFunctionNoAsync(completionHandler:() -> Void){
    completionHandler()
}

var sfNoAsync = 2
someFunctionNoAsync {
    sfNoAsync = 200
}
sfNoAsync

//在Class中 将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionAsync { self.x = 100 }
        someFunctionNoAsync { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers
completionHandlers[1]()
print(instance.x)

//自动闭包
//自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
customersInLine.count
customersInLine.remove(at: 0)
customersInLine.count
let customerProvider = { customersInLine.remove(at: 0) }
customersInLine.count
customerProvider()
customersInLine.count
