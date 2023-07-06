//
//  GameData.swift
//  iOS_076_ChungSeolah
//
//  Created by Chloe Chung on 2023/06/30.
//


/**
 1팀: 신짱구, 김철수, 이훈이
 2팀: 한유리, 맹구, 이슬이누나

 [상성]
   신짱구(7), 김철수(6), 이훈이(4)
   한유리(5), 맹구(6), 짱아(8)
 **/

import Foundation

//var randomAttackPower: Int = Int.random(in: 0...10)
//var randomDamage: Int = Int.random(in: 0...10)
//var randomDefense: Int = Int.random(in: 0...10)

protocol imageURL {
    var imageURLString: String { get set }
    var imageURL: URL { get }
}

struct Member: imageURL, Identifiable  {
    var id: UUID = UUID()
    var name: String
    var hp: Int
    var attackPower: Int
    var defense: Int
    
    var imageURLString: String
    var imageURL: URL {
        get {
            return URL(string: imageURLString)!
        }
    }
}


let logoImage: String = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaTzCfNvch5iS5uznRuqQC2DcBKVzogS83Eg&usqp=CAU"


// team1의 [배열]을 돌면서 name 인자를 받아오는 것

let team1: [Member] = [
    Member(name: "짱구", hp: 9, attackPower: 7, defense: 3, imageURLString: "https://mblogthumb-phinf.pstatic.net/MjAyMTEyMTVfMTk4/MDAxNjM5NTc2MDczODQ5.pQRJKUCHmN3q_FTTsNWxkkm5Y6vUTyVhPiaQPzSW6Y0g.CKPQfqZJJZsod_xq_o4h4mn8AiDz850SkQBluKDF0Lcg.JPEG.se413496/c26d66fb7c463f94b66b40d1549f2c6a.jpg?type=w800"),
    Member(name: "철수", hp: 5, attackPower: 6, defense: 4, imageURLString: "https://i.pinimg.com/550x/52/07/b7/5207b7f2464413e1cb64c002921c50b6.jpg"),
    Member(name: "훈이", hp: 4, attackPower: 3, defense: 7, imageURLString: "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcgdgX5%2FbtrSqMbgOPb%2F9UgyxqHvv8OnaqKCs42wrk%2Fimg.jpg"),
]

let team2: [Member] = [
    Member(name: "유리", hp: 8, attackPower: 5, defense: 3, imageURLString: "https://pbs.twimg.com/media/D2-4TrYU8AAVZCi.jpg"),
    Member(name: "맹구", hp: 3, attackPower: 8, defense: 2, imageURLString: "https://pbs.twimg.com/profile_images/1219857043298775041/VpnfMJqB_400x400.jpg"),
    Member(name: "짱아", hp: 10, attackPower: 9, defense: 1, imageURLString: "https://mblogthumb-phinf.pstatic.net/MjAxOTA3MTZfMjA0/MDAxNTYzMjEzNTk1NTk1.tCMj_C_EyMrnxWDx9YFAmD4uHlr_UPr5teUd9uS3isMg.vtjnj_MR4a80i0hZKBtRjVc07b-06dHoU1k0ccatRhkg.JPEG.mdibic/output_1548493285.jpg?type=w800")

]

var team1Attack: String = ""
var team2Attack: String = ""

// team1.character[index].

// 내hp - (상대attckPower + 내defense) = 남은 hp 6 vs hp 6 비김
func fight(player1: Member, player2: Member) -> String {
    let player1Result = player1.hp - (player2.attackPower - player1.defense)
    let player2Result = player2.hp - (player1.attackPower - player2.defense)
    
    if player1Result > player2Result {
        return "\(player1.name)가 이겼습니다."
       
//        Text("\(player1.name)가 이겼습니다.")
    } else if player1Result < player2Result {
        return "\(player2.name)가 이겼습니다."
    } else {
        return ("\(player1.name)와 \(player2.name)가 비겼습니다.")
        
    }
}

