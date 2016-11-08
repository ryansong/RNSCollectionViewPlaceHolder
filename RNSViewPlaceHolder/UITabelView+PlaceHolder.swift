//
//  UITabelView+PlaceHolder.swift
//  RNSCollectionViewPlaceHolder
//
//  Created by xiaomingsong on 11/8/16.
//  Copyright © 2016 xiaomingsong. All rights reserved.
//

import Foundation
import UIKit

protocol UICollectionViewPlaceHolderViewDelegate : NSObjectProtocol{
    var placeHolderView:UIView? {get set}
    func tableView(_ tableView:UITableView, showPlaceHolderView placeHolderView:UIView) -> Void
}

extension UITableView {
    
    func rns_reload() -> Void {
        self.reloadData()
        self.identifyPlaceHolder()
    }
    
    func identifyPlaceHolder() -> Void {
        
        if (self.dataSource != nil) {
            var isEmpty = true
            
            let sections = self.numberOfSections
            for i in 0..<sections {
                if (self.numberOfRows(inSection: i) > 0) {
                    isEmpty = false
                    break
                }
            }
            
            var placeHolderViewdelegate:UICollectionViewPlaceHolderViewDelegate?
            
            if (self is UICollectionViewPlaceHolderViewDelegate) {
                placeHolderViewdelegate = self as? UICollectionViewPlaceHolderViewDelegate
            } else if (self.dataSource is UICollectionViewPlaceHolderViewDelegate) {
                placeHolderViewdelegate = self.dataSource as? UICollectionViewPlaceHolderViewDelegate
            } else {
                
            }
            
            if placeHolderViewdelegate != nil {
                if let placeHolder = placeHolderViewdelegate?.placeHolderView {
                    if isEmpty {
                        placeHolderViewdelegate?.tableView(self, showPlaceHolderView: placeHolder)
                    } else {
                        placeHolder.removeFromSuperview()
                    }
                }
            }
        }
    }
}
