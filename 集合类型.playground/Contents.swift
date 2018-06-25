//: Playground - noun: a place where people can play

import UIKit

//创建一个空数组
var someInt = [Int]() //初始化的时候要显示
someInt.append(3)
someInt = []
someInt.append(2)

var someInt1 = Array<Int>()
var someInt2 = Array(repeating: 3, count: 4)
var someInt3 = someInt + someInt2

var someInt4 = [1,2,3,4]
var someInt5:[Int] = [1,2,3]

//访问和修改数组
someInt += [5]
someInt[0]
someInt[1] = 55
someInt
someInt4[1...3] = [11,22,33]
someInt4
//注意：不可以用下标访问的形式去在数组尾部添加新项。
someInt4.insert(12, at: 1)
someInt4.insert(122, at: 5) //可以在末尾添加
someInt4.remove(at: 0)
someInt4.removeLast(1)

//数组的遍历
for item in someInt4 {
    print(item)
}
for (index, value) in someInt4.enumerated(){
    print("index:\(index) and value:\(value)")
}

//基本集合操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
//使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合
oddDigits.intersection(singleDigitPrimeNumbers)
//使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
oddDigits.symmetricDifference(singleDigitPrimeNumbers)
//使用union(_:)方法根据两个集合的值创建一个新的集合。
oddDigits.union(singleDigitPrimeNumbers)
//使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。
oddDigits.subtracting(singleDigitPrimeNumbers)

//字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "我"
namesOfIntegers
namesOfIntegers = [:]


