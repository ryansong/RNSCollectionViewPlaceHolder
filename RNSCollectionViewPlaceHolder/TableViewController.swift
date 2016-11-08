//
//  TableViewController.swift
//  RNSCollectionViewPlaceHolder
//
//  Created by xiaomingsong on 11/8/16.
//  Copyright © 2016 xiaomingsong. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController, UICollectionViewPlaceHolderViewDelegate {

    var placeHolderView: UIView?
    
    var dataSource = Array<String>();
    
    override func viewDidLoad() {
        let label = UILabel()
        label.text = "placeHolder"
        label.sizeToFit()
        label.center = self.tableView.center
        self.placeHolderView = label
        
        self.tableView.tableFooterView = UIView()
        self.tableView.rns_reload()
    }
    
    @IBAction func addAction(_ sender: Any) {
        let s = String.init(format: "string  random %d", RAND_MAX%100)
        dataSource.append(s)
        self.tableView.rns_reload()
    }
    
    @IBAction func cleanAction(_ sender: Any) {
        if dataSource.isEmpty {
            return
        }
        dataSource.removeLast()
        self.tableView.rns_reload()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cellView?.textLabel?.text = self.dataSource[indexPath.row]
        return cellView!
    }
    
    func tableView(_ tableView:UITableView, showPlaceHolderView placeHolderView:UIView) -> Void {
        tableView.addSubview(placeHolderView);
        placeHolderView.center = tableView.center
    }
}
