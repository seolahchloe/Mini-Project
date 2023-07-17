//
//  ViewController.swift
//  PlusOne
//
//  Created by Chloe Chung on 2023/07/17.
//

import UIKit

class ViewController: UIViewController {
    
    let countLabel: UILabel = UILabel()
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildInterface()
    }
    
    func buildInterface() {
        countLabel.text = "0"
        countLabel.font = UIFont(name: "Helvetica", size: 50)
        countLabel.textColor = .black
        
        /*
         이런 절대 좌표를 사용하는 코드는 쓰지 않는다.
         countLabel.frame.origin = CGPoint(x: 150, y: 250)
         countLabel.frame.size = CGSize(width: 100, height: 100)
         */
        
        view.addSubview(countLabel)
        // addSubView 이후에 AutoLayout 관련 코드를 적어야 한다.
        // 이유는 viewController의 view와 해당 subview의 기본 관계가 성립되어야 레이아웃의 상대성이 생기기 때문이다.
        
        // 첫번째로 할 일은 자동으로 위치를 알아서 잡겠다는 의사를 포기해야 한다.
        // 그러니까 이제 우리가 새로 잡는 제약조건 안에서 autolayout이 적용된다는 선언이 된다.
        // "자동으로 제약을 변환하는 기능을 꺼버리자"
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 직접 제약 조건을 만들어보자 - countLabel을 한가운데로 정렬하기
        NSLayoutConstraint.activate([
            // countLabel의 중심 x축을 viewController의 view가 가지는 중심 x축과 동일하게 만든다.
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // countLabel의 중심 y축을 viewController의 view가 가지는 중심 y축과 동일하게 만든다.
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // 버튼 만들기
        let plusOneButton: UIButton = UIButton()
        plusOneButton.setTitle("Plus One", for: .normal)
        plusOneButton.setTitleColor(.blue, for: .normal)
        // 같은 viewController의 plusOne 함수를 실행시킬것이기 때문에 self라고 적는다.
        // Objective-C 시절의 UIKit 코드를 내부에서 쓰기 때문에 plusOne을 지칭하는 방법이 필요하다.
        plusOneButton.addTarget(self, action: #selector(plusOne), for: .touchUpInside)
        
        view.addSubview(plusOneButton)
        
        plusOneButton.translatesAutoresizingMaskIntoConstraints = false
        
        /* 이 방법도 있고
        NSLayoutConstraint.activate([
            // plusOneButton의 중심 x축을 viewController의 view가 가지는 중심 x축과 동일하게 만든다.
            plusOneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // plusOneButton의 가장 윗 부분을 countLabel의 가장 아래부분보다 50만큼 떨어진 위치로 만든다.
            plusOneButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 50),
        ])
         */
        
        // 이 방법으로 개별 제약조건들의 isActive를 true로 만드는 방법도 있다.
        plusOneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        plusOneButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 50).isActive = true
    }
    // Interface Builder와 연결되는 함수가 아니기 때문에 @IBAction이라고 붙여주지않아도 된다.
    // 대신 이런 경우 힘수의 이름을 잘 지어주어야 함.
    // Objective-C 시절의 UIKit 코드를 내부에서 쓰기 때문에 @objc라고 붙여야 한다.
    @objc func plusOne() {
        
        count += 1
        
        print("+1 버튼이 \(count)번 눌렸습니다.")
        
        countLabel.text = "\(count)"
    }
}

