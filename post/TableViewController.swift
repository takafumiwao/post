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
    
    var articles: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        let url: URL = URL(string: "https://fcbe6b4d.ngrok.io/getjson/")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String,AnyObject>
                let jsonname = json["friend"] as! [Any]
                let articles = jsonname.map { (article) -> [String: Any] in
                    return article as! [String: Any]
                }
                DispatchQueue.main.async() { () -> Void in
                    self.articles = articles
                
                    self.tableview.reloadData()
                }
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
        return 1
    }
    
    //セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return articles.count
        
    }
    
    
    
    //セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let article = articles[indexPath.section]
        let title1 = article["name"] as! String
        let title2 = article["text"] as! String
        cell.bindData(text: "\(title1)", text1: "\(title2)")
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
