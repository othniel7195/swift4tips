//: Playground - noun: a place where people can play

import UIKit

//下标语法(下标函数只能在类型内声明)
//subscript(index: Int) -> Int {
//    get {
//        // 返回一个适当的 Int 类型的值
//    }
//
//    set(newValue) {
//        // 执行适当的赋值操作
//    }
//}
//newValue的类型和下标的返回类型相同。如同计算型属性，可以不指定 setter 的参数（newValue）。如果不指定参数，setter 会提供一个名为newValue的默认参数。

//如同只读计算型属性，可以省略只读下标的get关键字：
//subscript(index: Int) -> Int {
// 返回一个适当的 Int 类型的值
//}


struct TimesTable {
    subscript(index:Int) -> String {
        return String(index * 3)
    }
}

struct TimesTable2 {
    subscript(index:Int, to:Int) -> String {
        return String(index * 3 - to)
    }
}

struct TimesTable3 {
    subscript(index: Int, to: Int) -> String{
        get{
          return String(index * 3 - to)
        }
        set{
            print("Times Table 3 New Value:\(newValue)")
        }
    }
}

let timesTable = TimesTable()
timesTable[10]

let timesTable2 = TimesTable2()
timesTable2[10, 5]

var timesTable3 = TimesTable3()
timesTable3[10, 6]
timesTable3[5, 8] = "100"
