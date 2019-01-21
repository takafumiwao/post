//
//  TableViewController.swift
//  post
//
//  Created by mgt on 2019/01/21.
//  Copyright © 2019 mgt. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        let url: URL = URL(string: "https://3e5c3c57.ngrok.io/getjson/")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any]
                print(json)
                
            }
            catch {
                print(error)
            }
        })
        task.resume() //実行する
    }

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
    
    //セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.bindData(text: "section: \(indexPath.section) index: \(indexPath.row)")
        return cell
    }
    
    //セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension TableViewController: UITableViewDelegate {
    //セルがタップされた時の処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")
    }
    
    //スクロールした時の処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}
