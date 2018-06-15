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
