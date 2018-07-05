//: Playground - noun: a place where people can play

import UIKit


//注意
//当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会触发任何属性观察者。


//构造器
//它的最简形式类似于一个不带任何参数的实例方法，以关键字init命名：

//init() {
//    // 在此处执行构造过程
//}


//自定义构造过程
//自定义构造过程时，可以在定义中提供构造参数，指定所需值的类型和名字。构造参数的功能和语法跟函数和方法的参数相同。


//构造过程中常量属性的修改
//你可以在构造过程中的任意时间点给常量属性指定一个值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可更改。
//注意
//对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。



//默认构造器
//如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift 会给这些结构体或类提供一个默认构造器（default initializers）。这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例。


//结构体的逐一成员构造器
//除了默认构造器，如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储型属性没有默认值。
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)


//值类型的构造器代理
//构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复
//值类型（结构体和枚举类型）不支持继承，所以构造器代理的过程相对简单，因为它们只能代理给自己的其它构造器。类则不同，它可以继承自其它类（请参考继承），这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化
//如果你为某个值类型定义了一个自定义的构造器，你将无法访问到默认构造器（如果是结构体，还将无法访问逐一成员构造器）



//注意
//假如你希望默认构造器、逐一成员构造器以及你自己的自定义构造器都能用来创建实例，可以将自定义的构造器写到扩展（extension）中，而不是写在值类型的原始定义中。



//类的继承和构造过程
//类里面的所有存储型属性——包括所有继承自父类的属性——都必须在构造过程中设置初始值
//指定构造器和便利构造器
//指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化
//每一个类都必须拥有至少一个指定构造器。在某些情况下，许多类通过继承了父类中的指定构造器而满足了这个条件


//指定构造器语法
//init(parameters) {
//    statements
//}


//便利构造器写法，但需要在init关键字之前放置convenience关键字，并使用空格将它们俩分开：

//convenience init(parameters) {
//    statements
//}


//类的构造器代理规则
//规则 1
//指定构造器必须调用其直接父类的的指定构造器。

//规则 2
//便利构造器必须调用同类中定义的其它构造器。

//规则 3
//便利构造器必须最终导致一个指定构造器被调用。


//安全检查 1
//指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器。
//安全检查 2
//指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值。如果没这么做，指定构造器赋予的新值将被父类中的构造器所覆盖
//安全检查 3
//便利构造器必须先代理调用同一类中的其它构造器，然后再为任意属性赋新值。如果没这么做，便利构造器赋予的新值将被同一类中其它指定构造器所覆盖。
//安全检查 4
//构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值。



//以下是两段式构造过程中基于上述安全检查的构造流程展示：
//
//阶段 1
//某个指定构造器或便利构造器被调用。
//完成新实例内存的分配，但此时内存还没有被初始化。
//指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化。
//指定构造器将调用父类的构造器，完成父类属性的初始化。
//这个调用父类构造器的过程沿着构造器链一直往上执行，直到到达构造器链的最顶部。
//当到达了构造器链最顶部，且已确保所有实例包含的存储型属性都已经赋值，这个实例的内存被认为已经完全初始化。此时阶段 1 完成。
//阶段 2
//从顶部构造器链一直往下，每个构造器链中类的指定构造器都有机会进一步定制实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
//最终，任意构造器链中的便利构造器可以有机会定制实例和使用self。



//构造器的继承和重写
//跟 Objective-C 中的子类不同，Swift 中的子类默认情况下不会继承父类的构造器。Swift 的这种机制可以防止一个父类的简单构造器被一个更精细的子类继承，并被错误地用来创建子类的实例。
//
//注意
//父类的构造器仅会在安全和适当的情况下被继承
class A {
    var width:Double
    init(width: Double){
        self.width = width
    }

}

class B: A {
    var bWidth:Double
     override init(width:Double){
        self.bWidth = width
        super.init(width: width)
        print("A width:\(width)")
    }
    
}

var a = A(width: 10.0);

var b = B(width: 100.0)


//注意
//子类可以在初始化时修改继承来的变量属性，但是不能修改继承来的常量属性。

//构造器的自动继承
//假设你为子类中引入的所有新属性都提供了默认值，以下 2 个规则适用：
//


class AA {
    var width:Double
    init(width: Double){
        self.width = width
    }
    init(width:Double, height:Double) {
        self.width = width
        print("height:\(height)")
    }
    
    convenience init(){
        self.init(width: 120.0)
    }
    
}
//规则 1
//如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器。
//
class BB: AA {
   
}

var bb = BB(width: 101)
var bb2 = BB()
//规则 2
//如果子类提供了所有父类指定构造器的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承所有父类的便利构造器。
//
//即使你在子类中添加了更多的便利构造器，这两条规则仍然适用。
//
class CC : AA {
    override init(width: Double) {
        super.init(width: width)
    }
    override init(width: Double, height: Double) {
        super.init(width: width, height: height)
    }
    
}


var cc = CC(width: 110)
var cc2 = CC()


//注意
//对于规则 2，子类可以将父类的指定构造器实现为便利构造器。
class DD : AA {
    override init(width: Double) {
        super.init(width: width)
    }
    convenience override init(width: Double, height: Double) {
        self.init(width: width)
    }
}
var dd = DD(width: 1110)
var dd2 = DD()




//可失败构造器
//注意
//可失败构造器的参数名和参数类型，不能与其它非可失败构造器的参数名，及其参数类型相同。
//可失败构造器会创建一个类型为自身类型的可选类型的对象。你通过return nil语句来表明可失败构造器在何种情况下应该“失败”。
//
//注意
//严格来说，构造器都不支持返回值。因为构造器本身的作用，只是为了确保对象能被正确构造。因此你只是用return nil表明可失败构造器构造失败，而不要用关键字return来表明构造成功。
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}



//带原始值的枚举类型的可失败构造器
//带原始值的枚举类型会自带一个可失败构造器init?(rawValue:)，该可失败构造器有一个名为rawValue的参数，其类型和枚举类型的原始值类型一致，如果该参数的值能够和某个枚举成员的原始值匹配，则该构造器会构造相应的枚举成员，否则构造失败





//重写一个可失败构造器
//如同其它的构造器，你可以在子类中重写父类的可失败构造器。或者你也可以用子类的非可失败构造器重写一个父类的可失败构造器。这使你可以定义一个不会构造失败的子类，即使父类的构造器允许构造失败。
//
//注意，当你用子类的非可失败构造器重写父类的可失败构造器时，向上代理到父类的可失败构造器的唯一方式是对父类的可失败构造器的返回值进行强制解包

class NameA {
    var name: String?
    init?(name: String) {
        self.name = name
    }
}

class NameB: NameA{
    override init(name: String) {
        super.init(name: name)!
    }
}


var nameb = NameB(name: "YUO")


//可失败构造器 init!
//你可以在init?中代理到init!，反之亦然。你也可以用init?重写init!，反之亦然。你还可以用init代理到init!，不过，一旦init!构造失败，则会触发一个断言。


//必要构造器
//在类的构造器前添加required修饰符表明所有该类的子类都必须实现该构造器
//在子类重写父类的必要构造器时，必须在子类的构造器前也添加required修饰符，表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，不需要添加override修饰符
//注意
//如果子类继承的构造器能满足必要构造器的要求，则无须在子类中显式提供必要构造器的实现。


//普通子类
//
//通常情况下，一说到required修饰符，我们最先想到的应该就是普通类（class）的init()方法了。比如下面这个类：


class MyClass {
    var str:String
    init(str:String) {
        self.str = str
    }
}
//当我们定义一个MyClass的子类（subclass）并实例化这个子类时，我们一般会如何做呢？没错，通常情况下都会是这样：


class MyClass {
    var str:String
    init(str:String) {
        self.str = str
    }
}

class MySubClass:MyClass {
    
}

var MySubClass(str:"Hello Swift")
//大伙应该已经注意到了，在实例化MySubClass时，其实是继承了它父类MyClass的init()方法。那我们再来看看子类的初始化方法。
//
//子类的初始化方法
//
//如果我们在子类中添加一个init()方法，像这样：


class MyClass {
    var str:String
    init(str:String) {
        self.str = str
    }
}

class MySubClass:MyClass {
    override init(str:String) {
        super.init(str:str)
    }
}

var MySubClass(str:"Hello Swift")
//那么我们首先要在init()方法前加上override修饰符，表示MySubClass重写了其父类的init()方法，然后还要调用父类的init()方法，并将参数一并传给父类的方法。

//在实际运用中，也有另外一种情况，当子类的初始化方法参数类型与父类的初始化方法参数类型不同时，我们就不必在子类的初始化方法前加override修饰符了，但是要把子类初始化方法的参数类型转换为符合父类初始化方法的参数类型，然后传给父类的初始化方法：


class MyClass {
    var str:String
    init(str:String) {
        self.str = str
    }
}

class MySubClass:MyClass
{
    init(i:Int) {
        super.init(str:String(i))
    }
}

MySubClass(i: 10)
//required修饰符
//
//我们给父类的init()方法加上required修饰符后会发生什么呢，我们来看看：


class MyClass {
    var str:String
    required init(str:String) {
        self.str = str
    }
}

class MySubClass:MyClass
{
    init(i:Int) {
        super.init(str:String(i))
    }
    // 编译错误
}

//MySubClass(i: 10)
//我们可以看到上面的代码在编译会发生错误，因为我们没有实现父类中要去必须要实现的方法。我们应该这样写：


class MyClass {
    var str:String
    required init(str:String) {
        self.str = str
    }
}

class MySubClass:MyClass
{
    required init(str:String) {
        super.init(str: str)
    }
    
    init(i:Int) {
        super.init(str:String(i))
    }
    
}

MySubClass(i: 10)
//从上面的代码示例中不难看出，如果子类需要添加异于父类的初始化方法时，必须先要实现父类中使用required修饰符修饰过的初始化方法，并且也要使用required修饰符而不是override。
//
//如果子类中不需要添加任何初始化方法，我们则可以忽略父类的required初始化方法：


class MyClass {
    var str:String
    required init(str:String) {
        self.str = str
    }
}

class MySubClass:MyClass
{
    
    
}

MySubClass(str: "hello swift")
//在这种情况下，编译器不会报错，因为如果子类没有任何初始化方法时，Swift会默认使用父类的初始化方法。在Apple的文档中也有相关描述：
//
//You do not have to provide an explicit implementation of a required initializer if you can satisfy the requirement with an inherited initialiser.
//
//required修饰符的使用规则
//
//required修饰符只能用于修饰类初始化方法。
//当子类含有异于父类的初始化方法时（初始化方法参数类型和数量异于父类），子类必须要实现父类的required初始化方法，并且也要使用required修饰符而不是override。
//当子类没有初始化方法时，可以不用实现父类的required初始化方法。




//通过闭包或函数设置属性的默认值
class SomeClass {
    let someProperty: SomeType = {
        // 在这个闭包中给 someProperty 创建一个默认值
        // someValue 必须和 SomeType 类型相同
        return someValue
    }()
}
//注意闭包结尾的大括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。
//
//注意
//如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其它部分都还没有初始化。这意味着你不能在闭包里访问其它属性，即使这些属性有默认值。同样，你也不能使用隐式的self属性，或者调用任何实例方法

