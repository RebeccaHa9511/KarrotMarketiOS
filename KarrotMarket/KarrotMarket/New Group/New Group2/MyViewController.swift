//
//  MyViewController.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit

class MyVC: UIViewController, UITableViewDataSource {

    var mySettingsDataManager = MySettingsDataManager()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myTableView.dataSource = self
        myTableView.delegate = self
        
//        myTableView.estimatedRowHeight = UITableView.automaticDimension
        
        mySettingsDataManager.makeMySettingsData()
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySettingsDataManager.getMySettingsData().count + 1
        //custom cell 하나 추가해줬으므로 +1 해줘야함
        }
       
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //구체적인 cell의 형태를 구현
        //제일 위에 CELL 하나만 Custom으로 바꿔주기
  
        if indexPath.row < 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMySettingsCell", for: indexPath) as! CustomMySettingsCell
            
            return cell
        }
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        //index 0번은 custom Cell 이므로 -1부터 시작
        let mySettings = mySettingsDataManager.getMySettingsData()[indexPath.row - 1]
        

        cell.iconimg.image = mySettings.settingsIcons
        cell.settingsTxt.text = mySettings.settingsText

        cell.selectionStyle = .gray

        
        return cell
}

}
extension MyVC : UITableViewDelegate {
    
}
