//
//  main.swift
//  Test
//
//  Created by nmi on 2018/10/8.
//  Copyright © 2018 nmi. All rights reserved.
//
import Foundation

print("Hello, World!")

/*
 Weak - when an object is indepenet to another one
 */
class Society {
    var members: [Person] = []
    func join(newMember: Person) {
        members.append(newMember)
    }
    
    deinit {
        print("deinit Society")
    }
}

class Person {
    weak var mySociety: Society?
    func join(society:Society){
        mySociety = society
        society.join(newMember: self)
    }
    
    deinit {
        print("deinit Person")
    }
}

var soc:Society? = Society.init()
var p:Person? = Person.init()
p!.join(society: soc!)

soc = nil
p = nil

/*
 Unowned - when an object depends on another, and also weak refer to it
 Order cannot exist without customer, but customer can exist wo order
*/

class Order {
    unowned var customer:Customer
    init(orderPlaceBy:Customer) {
        customer = orderPlaceBy
    }
    deinit {
        print("deinit order")
    }
}

class Customer {
    var myOrder:[Order] = []
    deinit {
        print("deinit customer")
    }
}


var c:Customer? = Customer.init()
c!.myOrder.append(Order.init(orderPlaceBy: c!))
c = nil