//
//  NewPostVC.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit



class NewPostVC: UIViewController, UINavigationControllerDelegate  {

    let defaults = UserDefaults.standard
    
    var usedItemsDataManager = UsedItemsDataManager()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var imagePicker = UIImagePickerController()
    var arrPhotos: Array = [ #imageLiteral(resourceName: "베게1"), #imageLiteral(resourceName: "베게2") ]
    
    
    // MARK: - VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTextView.delegate = self
        setupNavigationBarButton()
        usedItemsDataManager.makeUsedItemsData()
        
    }
    
// MARK: - NAVIGATION TAB
    
    func setupNavigationBarButton() {
        //Backbutton Customize
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.image = UIImage(named: "multiply")
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveButtonTapped))
        
    }
    

    // MARK: - BUTTON ACTION
    
    @IBAction func openImageButtonTapped(_ sender: UIButton) {
        self.openImagePicker()
    }
    

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
//        usedItemsDataManager.makeNewUsedItem(UsedItems(usedItemsTitle: titleTextField.text!, usedItemsPrice: priceTextField.text!, usedItemsLocation: "", usedItemsLastUpdate: "", content: mainTextView.text, views: 1, category: "가구"))
        
        let items = UsedItems(usedItemsTitle: titleTextField.text!, usedItemsPrice: priceTextField.text!, usedItemsLocation: "", usedItemsLastUpdate: "", content: mainTextView.text, views: 1, category: "가구")
        
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.setValue(encoded, forKey: "items")
        }


        _ = navigationController?.popViewController(animated: true)
        
    }


    
    // 다른 곳을 터치하면 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

// MARK: - DELEGATES

extension NewPostVC: UITextViewDelegate {
    // 입력을 시작할때
    // (텍스트뷰는 플레이스홀더가 따로 있지 않아서, 플레이스 홀더처럼 동작하도록 직접 구현)
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요." {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    // 입력이 끝났을때
    func textViewDidEndEditing(_ textView: UITextView) {
        // 비어있으면 다시 플레이스 홀더처럼 입력하기 위해서 조건 확인
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요."
            textView.textColor = .lightGray
        }
    }
}

// MARK: - IMAGE PICKER

extension NewPostVC: UIImagePickerControllerDelegate {
    func openImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        dismiss(animated: true, completion: nil)
        if let img = info[.originalImage] as? UIImage {
            self.imageView.image = img
        }
    }
}

