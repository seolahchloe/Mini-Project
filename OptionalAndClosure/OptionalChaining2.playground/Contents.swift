import UIKit

/*
 옵셔널 체닝에서 ?의 의미는
 ? 바로 앞에 있는 존재가 nil인지 따져서
 nil이면 거기서 끝! 다음줄 코드 실행으로 바로 넘어감
 nil이 아니면 ? 이후의 내용에 접근, 정상 실행...
 */

class Person {
    var residence: Residence?
}

class Residence {
    var rooms: [Room] = []
    var address: Address?
    
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(index: Int) -> Room {
        get {
            return rooms[index]
        }
        set(newRoom) {
            rooms[index] = newRoom
        }
    }
    
    func printNumberOfRooms() {
        print("\(numberOfRooms)개의 방이 있습니다")
    }
}

class Room {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    // 주소 설명문 생성이 안될 경우를 대비해 옵셔널 타입으로 반환하는 함수
    func buildingIdentifier() -> String? {
        if let buildingNumber, let street {
            return "\(buildingNumber) \(street)"
        } else if let buildingName {
            return "\(buildingName)"
        } else {
            return nil
        }
    }
}



let john = Person()

john.residence = Residence()

if let rooms = john.residence?.numberOfRooms {
    if john.residence?.printNumberOfRooms() != nil {
        print("숙소에 방들이 있다고 합니다")
    }
} else {
    print("숙소가 아직 정해지지 않았습니다")
}

func createAddress() -> Address {
    print("주소 생성 함수 실행 시작!")
    
    let someAddress: Address = Address()
    someAddress.buildingNumber = "29-1"
    someAddress.street = "종로"
    
    return someAddress
}

john.residence?.address = createAddress()


if let address = john.residence?.address {
    if let buildingInfo = address.buildingIdentifier() {
        print("\(buildingInfo)")
    }
}
