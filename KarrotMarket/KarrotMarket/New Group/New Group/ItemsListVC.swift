//
//  ItemsListVC.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit

class ItemsListVC: UIViewController, UITableViewDataSource {
    
    var usedItemsDataManager = UsedItemsDataManager()
    var usedItems: [UsedItems] = []
    var page = 1

    
    @IBOutlet weak var tableView: UITableView!
    
    let defaults = UserDefaults.standard
    var refreashControl = UIRefreshControl()
    
    @objc func pullToRefreash(_ sender: Any) {
        self.usedItems = []
        self.page = 1
        tableView.reloadData()

    }
    
    // MARK: - ViewdidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreashControl.addTarget(self, action: #selector(pullToRefreash(_:)), for: .valueChanged)
        
        tableView.refreshControl = refreashControl
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 120
        
        usedItemsDataManager.makeUsedItemsData()
        if let savedData = UserDefaults.standard.object(forKey: "items") as? Data {
            let decoder = JSONDecoder()
            if let savedObject = try? decoder.decode(UsedItems.self, from: savedData) {
                usedItemsDataManager.makeNewUsedItem(savedObject)
            }
        }
        tableView.reloadData()

    }
    
    // MARK: - View Will appear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
      
    }
    
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return usedItemsDataManager.getUsedItemsData().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsedItemsTableViewCell", for: indexPath) as! UsedItemsTableViewCell


        let useditems = usedItemsDataManager.getUsedItemsData()[indexPath.row]

//        cell.usedItemsImgView.text = useditems.usedItemsImg
        cell.usedItemsTitleText.text = useditems.usedItemsTitle
        cell.usedItemsPriceTxt.text = useditems.usedItemsPrice
        cell.usedItemsLocation.text = useditems.usedItemsLocation
        cell.usedItemsUpdatedTime.text = useditems.usedItemsLastUpdate

        

        cell.selectionStyle = .gray


        return cell
    }

    }

// MARK: - Delegate

extension ItemsListVC: UITableViewDelegate {
    //indexPath에서 몇번째 cell이 touched 됬는지 전달받음.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
                // 화면 전환 애니메이션 설정
                detailVC.modalTransitionStyle = .coverVertical
                // 전환된 화면이 보여지는 방법 설정 (fullScreen)
                detailVC.modalPresentationStyle = .fullScreen
                self.present(detailVC, animated: true, completion: nil)
        
    }
 
        }
