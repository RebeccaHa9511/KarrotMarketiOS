//
//  DetailVC.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productNamelbl: UILabel!
    @IBOutlet weak var productUpdatedTime: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var categorylbl: UILabel!
    
    //Middle View
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var chatButton: UIButton!

    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    //Images Control
    @IBOutlet weak var detailImageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //CollectionView
    @IBOutlet weak var recommendsCollectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    @IBOutlet weak var collectionViewheight: NSLayoutConstraint!
    
    //Bottom View
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    var heartStatus : Bool!
    
    
    var usedItemsData: UsedItems?
    var recommendedProducts : [RecommendedProducts] = []
    
    var mainImages = [ #imageLiteral(resourceName: "비스크돌"), #imageLiteral(resourceName: "베게2"), #imageLiteral(resourceName: "베게1") ]
    var mainImageViews = [UIImageView]()
    
    // MARK: - ScrollView on Top
    private func addContentScrollView() {
           for i in 0..<mainImages.count {
               let imageView = UIImageView()
               let xPos = self.view.frame.width * CGFloat(i)
               imageView.frame = CGRect(x: xPos, y: 0, width: detailImageScrollView.bounds.width, height: detailImageScrollView.bounds.height)
               imageView.image = mainImages[i]
               detailImageScrollView.addSubview(imageView)
               detailImageScrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
           }
       }
    private func setPageControl() {
         pageControl.numberOfPages = mainImages.count
     }
    
    private func setPageControlSelectedPage(currentPage:Int) {
          pageControl.currentPage = currentPage
      }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let value = scrollView.contentOffset.x/scrollView.frame.size.width
          setPageControlSelectedPage(currentPage: Int(round(value)))
      }
    
    // MARK: - ViewDid Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupUI()
        setupInfo()
        setupCollectionView()
        
        setRecommend()
        recommendsCollectionView.delegate = self
        recommendsCollectionView.dataSource = self
        
        heartStatus = false
    }
    
    
    // MARK: -  HEART ACTION
    @IBAction func heartButtonTapped(_ sender: Any) {
        if heartStatus == false {
            likeButton.tintColor = .red
            likeButton.setImage(UIImage (systemName: "heart.fill"), for: UIControl.State.normal)
            heartStatus = true
        }else{
            likeButton.tintColor = .darkGray
            likeButton.setImage(UIImage (systemName: "heart"), for: UIControl.State.normal)
            heartStatus = false
        }
    }
    
    
    // MARK: - NAVIGATION BAR
    
    func setupNaviBar() {
        //Backbutton Customize
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.image = UIImage(named: "arrow.backward")
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        //Transparent Navi Bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.shadowColor = .clear
        appearance.backgroundColor = .clear
        appearance.backgroundImage = nil
        appearance.shadowImage = nil
    }
    
    // MARK: - Configure UI
    
    func setupUI(){
        chatButton.clipsToBounds = true
        chatButton.layer.cornerRadius = 10
        
        bottomView.layer.borderWidth = 3
        bottomView.layer.borderColor = CGColor.init(red: 211, green: 211, blue: 211, alpha: 1)
        
    }
    
    func setupCollectionView(){
        layout.scrollDirection = .vertical

        if let layout = recommendsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = recommendsCollectionView.frame.width
            layout.itemSize = CGSize(width: width, height: width / 19 * 25)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 5
            layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
       
    }
    
    
    
    func setupInfo() {
        if let useditemsdata = usedItemsData {
            locationLbl.text = useditemsdata.usedItemsLocation
            productNamelbl.text = useditemsdata.usedItemsTitle
            productUpdatedTime.text = useditemsdata.usedItemsLastUpdate
            priceLbl.text = useditemsdata.usedItemsPrice
            contentLbl.text = useditemsdata.content
            categorylbl.text = useditemsdata.category
            
        }
    }
    
    // MARK: - SET RECOMMENDS
    
    func setRecommend() {
        recommendedProducts.append(contentsOf: [
            RecommendedProducts(imageName: UIImage(named: "빈티지"), name: "빈티지 버켄스탁", price: "20,000원"),
        RecommendedProducts(imageName: UIImage(named: "프랑스2"), name: "프랑스 오리지널 엔틱빈티지...", price: "280,000원"),
        RecommendedProducts(imageName: UIImage(named: "샌들2"), name: "여성샌들 240", price: "15,000원"),
        RecommendedProducts(imageName: UIImage(named: "샌들2"), name: "수제화 샌들 240", price: "15,000원")
        ])
    }
    
    
    
}

// MARK: - Delegate, DataSource

extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func changeHeight() {
        self.collectionViewheight.constant = self.recommendsCollectionView.collectionViewLayout.collectionViewContentSize.height
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == self.recommendsCollectionView {
            return 4
        } else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendsCollectionViewCell.identifier, for: indexPath) as? RecommendsCollectionViewCell else {
                return UICollectionViewCell()
            }
            
        let recommendData = recommendedProducts[indexPath.row]
        cell.recommendsImg.image = recommendData.imageName
        cell.recommendsName.text = recommendData.name
        cell.recommendsPrice.text = recommendData.price
        
            cell.backgroundColor = .white
            
            return cell
        }
        

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 180, height: 200)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }
    
    
    }

