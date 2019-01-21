//
//  ViewController.swift
//  post
//
//  Created by mgt on 2019/01/18.
//  Copyright © 2019 mgt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func post(_ sender: UIButton) {
        let urlString = "https://3e5c3c57.ngrok.io/getpost/"
        let request =  NSMutableURLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params:[String] = ["\(textfield.text!)","\(textView.text!)"]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                let resultData = String(data: data!, encoding: .utf8)!
                print("result:\(resultData)")
                print("response:\(response!)")
            })
            task.resume()
        }catch{
            print("Error:\(error)")
            return
        }
    }
    
}

