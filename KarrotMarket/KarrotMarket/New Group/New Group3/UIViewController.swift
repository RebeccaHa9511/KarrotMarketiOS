//
//  UIViewController.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//
import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
                
        return instantiateFromNib()
    }
}

