//
//  CarData.swift
//  TheCar
//
//  Created by Chloe Chung on 2023/07/25.
//

import Foundation

var carData: [Car] = loadJson("carData.json")

// 원문의 코드는 제너릭을 사용해서 어떤 타입의 결과든 만들도록 범용성을 갖게 했지만
// 실제로 이 프로젝트에서는 T라는 가상의 타입이 Car 인스턴스들의 배열 타입으로 작동할 것이다.
// 따라서 아래와 같이 작성해도 이 프로젝트에서는 괜찮다.
func loadJson(_ filename: String) -> [Car] {
    let data: Data
    
    // 프로젝트의 번들 파일들 중에서 해당 이름의 파일이 존재하는지 확인해서
    // 그 파일이 있다면 file이라는 주소 값에 담고
    // 없다면 에어를 발생시키고 중지한다
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    // 존재하는 file 주소에 접근해 그 내용을 읽어서 Data 값으로 만든다.
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    
    // 이제 Data 타입의 내용을 JSON이라고 생각해서
    // 원래 우리가 목표로 한 [Car] 타입으로 변환시켜 담아보도록 한다
    do {
        return try JSONDecoder().decode([Car].self, from: data)
    } catch {
        fatalError("Unable tp parse \(filename): \(error)")
    }
}
