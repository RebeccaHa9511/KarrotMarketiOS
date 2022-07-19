//
//  LifeStyleVC.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit

class LifeStyleVC: UIViewController, UITableViewDataSource {

    var lifeStyleDataManager = LifeStyleDataManager()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        lifeStyleDataManager.makeLifeStyleData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifeStyleDataManager.getLifeStyleData().count
    }
    
    //몇번째 있는 cell 은 어떠한 방식으로 표시를 해주면 되는지?
    //tableViewCell 을 리턴해주는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        //구체적인 cell의 형태를 구현
        let cell = tableView.dequeueReusableCell(withIdentifier: "LifeStyleTableViewCell", for: indexPath) as! LifeStyleTableViewCell
        
        let lifestyle = lifeStyleDataManager.getLifeStyleData()[indexPath.row]
        
        cell.lsImage.image = lifestyle.lifeStyleImg //배열에 접근해서 이미지를 꺼내서 넣어줌. (같은 옵셔널 타입이라서 옵셔널 바인딩 따로 필요 x)
        cell.lsLocationlbl.text = lifestyle.userLoc
        cell.lsTimelbl.text = lifestyle.updateTime
        cell.lsusernamelbl.text = lifestyle.userID
        cell.lsDetailslbl.text = lifestyle.lifeStyleDetails
        cell.lscategoryIconLabel.text = lifestyle.categoryIcon

        
        cell.selectionStyle = .gray
        
        
        return cell
    }

    

}

extension LifeStyleVC: UITableViewDelegate {
    //indexPath에서 몇번째 cell이 touched 됬는지 전달받음.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
    }
    
        }
