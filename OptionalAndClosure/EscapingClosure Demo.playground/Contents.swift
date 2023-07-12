import UIKit

// 함수들을 여기에 담아보자, 단 () -> Void 타입의 함수들만
var completionHandlers: [() -> Void] = []

// 이 함수가 끝난 뒤에도 completionHandlers에 포함시킨
// completionHandler 함수는 나중에 꺼내서 일 시키기 위해
// 이 함수 바깥으로 탈출시켜줘야 한다.
// 그 키워드가 @escaping이디.
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

someFunctionWithEscapingClosure {
    print("Hello my firend!")
}

someFunctionWithEscapingClosure {
    print("play with my firend!")
}

someFunctionWithEscapingClosure {
    print("See you agian, my firend!")
}


// 배열 completionHandlers의 첫번째 내용이 있으면 그게 함수니까 실행해보자
completionHandlers.first?()

// 하나씩 꺼내서 다 실행도 가능
// 이런 이론으로 나온 존재가 operationQueue. 참고해보기
// 최근엔 async/await 때문에 잘 안쓰이긴함
for handler in completionHandlers {
    handler()
}


completionHandlers = []


// Escaping으로 탈출시킨 뒤에 나중에 실행하는게 아니라
// 함수가 받은 함수를 그 안에서 바로 실행하는 경우의 예시
func someFunctionWithNoneEscapingClosure(closure: () -> Void) {
    // closure는 someFunctionWithNoneEscapingClosure 함수가 끝나면
    // 함께 파괴된다. 그 전에 실행 한 번 해보자
    closure()
}

someFunctionWithEscapingClosure {
    print("Hello World")
}

class SomeClass {
    var x: Int = 10
    
    func doSomething() {
        // doSomething 메서드가 다 끝난 뒤에 언젠가 x = 100으로 만드는 일을 해줄거임
        someFunctionWithEscapingClosure (completionHandler: { self.x = 100 } )
        
        // 당장 x는 200으로 만들어주기
        someFunctionWithNoneEscapingClosure { x = 200 }
    }
    
    func doPrint() {
        print("\(x)")
    }
}

let instance: SomeClass = SomeClass()
//print("\(instance.x)")
instance.doSomething()
instance.doPrint()

// doSomething()은 이미 한 번 실행되어서 당장 x를 200으로 만들어 위처럼 출력도 했지만
// 아래의 completionHandlers의 내용을 하나식 꺼내서 실행시키면
// 미리 준비된 { self.x = 100 } 클로저도 실행되어서 x는 100이 된다.
for handler in completionHandlers {
    handler()
}

instance.doPrint()
