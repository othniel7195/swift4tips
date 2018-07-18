//: Playground - noun: a place where people can play

import UIKit


//检查类型
//用类型检查操作符（is）来检查一个实例是否属于特定子类型

//向下转型
//某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，
//你可以尝试向下转到它的子类型，用类型转换操作符（as? 或 as!）。
//注意
//转换没有真的改变实例或它的值。根本的实例保持不变；只是简单地把它作为它被转换成的类型来使用。

//Any 和 AnyObject 的类型转换
//Swift 为不确定类型提供了两种特殊的类型别名：
//
//Any 可以表示任何类型，包括函数类型。
//AnyObject 可以表示任何类类型的实例。
注意
Any类型可以表示所有类型的值，包括可选类型。Swift 会在你用Any类型来表示一个可选值的时候，给你一个警告。如果你确实想使用Any类型来承载可选值，你可以使用as操作符显式转换为Any，如下所示：

let optionalNumber: Int? = 3
things.append(optionalNumber)        // 警告
things.append(optionalNumber as Any) // 没有警告
