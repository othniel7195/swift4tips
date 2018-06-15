//: Playground - noun: a place where people can play

import UIKit

//字符串字面量
let someString = "Some string literal value\nAAA"
print(someString)
//多行字符串字面量
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" \n\n\nhe asked.\
"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)
//(""" """ 直接写的文案会按你写的形式显示  如果你写的时候是换行的 显示的时候也是换行的
// 如果想写的时候换行 显示不换行  加 \)

//初始化空字符串
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法

//字符串是值类型
//Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作

//遍历字符串
for ichar in "什么鬼呀" {
    print(ichar)
}

//连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
var instruction = "look over"
instruction += string2
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
//注意：您不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符。
//如果你需要使用多行字符串字面量来拼接字符串，并且你需要字符串每一行都以换行符结尾，包括最后一行

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"

let eAcuteString = "\u{E9}"
print(eAcuteString.count)
let combinedEAcuteString = "\u{65}\u{301}"
print(combinedEAcuteString.count)

//访问和修改字符串
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 3)

for index in greeting.indices{
    print("\(greeting[index])","@",separator: "~", terminator: "")
}

//插入和删除
var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)
welcome1[welcome1.index(before: welcome1.endIndex)]
welcome1.remove(at: welcome1.index(before: welcome1.endIndex))
print(welcome1)

