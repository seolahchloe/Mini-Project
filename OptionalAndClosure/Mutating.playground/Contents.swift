import UIKit

class MyClass {
    var name: String = "Chloe"
    
    func changeName(name: String) {
        self.name = name
    }
}

struct MyStruct {
    var name: String = "Chloe"
    
    // 값 타입인 struct와 enum의 프로퍼티를 수정하려면
    // 해당 메서드 앞에 mutating이라고 붙여줘야한다.
    mutating func changeNmae(name: String) {
        self.name = name
    }
}
