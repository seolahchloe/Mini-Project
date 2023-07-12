import UIKit

/*
 makeIncrementer 함수를 호출하면
 forIncrement값 만큼 매번 호출할 때마다 값을 증가시키는
 () -> Int 타입의 함수를 만들어준다
 */
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    
    var runningTotal: Int = 0
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
    
}


func makeIncrementer2(forIncrement amount: Int) -> () -> Int {
    
    var runningTotal: Int = 0
    
    let incrementer = { () -> Int in
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
    
}

func makeIncrementer3(forIncrement amount: Int) -> () -> Int {
    
    var runningTotal: Int = 0
    
    return { () -> Int in
        runningTotal += amount
        return runningTotal
    }
}

// 실행할 때마다 3씩 증가시키는 함수를 만들어줘!!!
let myFunc: () -> Int = makeIncrementer3(forIncrement: 3)

print("\(myFunc())")
print("\(myFunc())")
print("\(myFunc())")
