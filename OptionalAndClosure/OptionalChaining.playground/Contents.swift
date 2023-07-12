import UIKit

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
    var stars: Star?
}

class Star {
    var count: Int = 2
}

let john = Person()

john.residence = Residence()

// 옵셔널 체이닝으로 가는 방법
if let rooms = john.residence?.numberOfRooms {
    print("\(rooms)개의 방이 있습니다")
} else {
    print("숙소가 아직 정해지지 않았습니다")
}

if let count = john.residence?.stars?.count {
    print("이 숙소는 \(count) 등급입니다")
} else {
    print("이 숙소는 등급분류가 되지 않았습니다")
}

// 옵셔널 체이닝 안쓰고 가는 방법
if let residence = john.residence {
    let rooms: Int = residence.numberOfRooms
    print("\(rooms)개의 방이 있습니다")
    
    if let stars = residence.stars {
        let count: Int = stars.count
        print("이 숙소는 \(count) 등급입니다")
    } else {
        print("이 숙소는 등급분류가 되지 않았습니다")
    }
} else {
    print("숙소가 아직 정해지지 않았습니다")
}
