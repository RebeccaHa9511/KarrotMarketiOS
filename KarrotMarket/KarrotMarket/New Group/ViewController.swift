//
//  ViewController.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {
  

    @IBOutlet weak var floatingButton: UIButton!
    
    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var secondButtton: UIStackView!
    @IBOutlet weak var firstButton: UIStackView!
    
    // MARK: - VIEWDIDLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton.clipsToBounds = true
        firstButton.layer.cornerRadius = 10
        
        secondButtton.clipsToBounds = true
        secondButtton.layer.cornerRadius = 10
    }
    
    // MARK: -  SET FLOATING BUTTON
    
    lazy var buttons: [UIStackView] = [self.firstButton, self.secondButtton] // 띄울 버튼 목록
    var isShowingFloating: Bool = false // 플로팅 버튼 상태
    
    // 플로팅 버튼 클릭시 전체 뷰 어둡게
    lazy var floatingDimView: UIView = {
            let view = UIView(frame: self.view.frame)
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            view.alpha = 0
            view.isHidden = true

            self.view.insertSubview(view, belowSubview: self.floatingStackView)

            return view
        }()
    
    @IBAction func floatingActionButton(_ sender: UIButton) {
        if isShowingFloating {
                    buttons.reversed().forEach { button in
                        UIView.animate(withDuration: 0.3) {
                            button.isHidden = true
                            self.view.layoutIfNeeded()
                        }
                    }

                    UIView.animate(withDuration: 0.5, animations: {
                        self.floatingDimView.alpha = 0
                    }) { (_) in
                        self.floatingDimView.isHidden = true
                    }
                } else {

                    self.floatingDimView.isHidden = false

                    UIView.animate(withDuration: 0.5) {
                        self.floatingDimView.alpha = 1
                    }

                    buttons.forEach { [weak self] button in
                        button.isHidden = false
                        button.alpha = 0

                        UIView.animate(withDuration: 0.3) {
                            button.alpha = 1
                            self?.view.layoutIfNeeded()
                        }
                    }
                }

        isShowingFloating = !isShowingFloating

                let image = isShowingFloating ? UIImage(named: "엑스") : UIImage(named: "AddButton")
                let roatation = isShowingFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity

                UIView.animate(withDuration: 0.3) {
                    sender.setImage(image, for: .normal)
                    sender.transform = roatation
                }
        
    }
    

}
  
