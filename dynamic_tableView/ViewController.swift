//
//  ViewController.swift
//  dynamic_tableView
//
//  Created by 김홍석 on 2022/05/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let contentsList = [
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cell 리소스 파일 가져오기
        let MyTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        
        // cell에 리소스 등록
        self.myTableView.register(MyTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        
        // 유동적으로 높이를 조절할 경우 reload할 때 이상한 곳으로 갈 수 있다. -> 방지를 위해 아래 코드 작성
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.estimatedRowHeight = 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        
        cell.userContents.text = contentsList[indexPath.row]
        
        return cell
    }
}

