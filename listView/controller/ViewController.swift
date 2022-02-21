//
//  ViewController.swift
//  listView
//
//  Created by helloKaviraj MBP on 17/02/22.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    // Below array to store json data in string format
    var arr_data: [String] = [String]()
    
    // Table view data display code number 19 to 27
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = tableView.dequeueReusableCell(withIdentifier: "cell")
        cells?.textLabel?.text = arr_data[indexPath.row]
        return cells!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Table view important property delegate and datasource added on view load
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let api = "https://api.github.com/repos/Alamofire/Alamofire/issues"
        
        Alamofire.request(api, method: .get).responseJSON { (myResponse) in
            switch myResponse.result {
            case .success:
                print(myResponse.result) //SUCESS message will print if everything works fine
            
                let myResult = try? JSON(data: myResponse.data!) // This will fetch complete JSON data
                
                // I'm fetching user section data for demo purpose
                if let myWrappedResult = myResult {
                    let resultArray = myWrappedResult[0]["user"]
                    let avaturl = resultArray["avatar_url"].stringValue
                    let login = resultArray["login"].stringValue
                    let id = resultArray["id"].stringValue
                    
                    // All data appended to array and display in table view
                    self.arr_data.append(avaturl)
                    self.arr_data.append(login)
                    self.arr_data.append(id)
                    
                    print(avaturl)
                    print(login)
                    print(id)
                    self.tableView.reloadData() // Reloading data in table view
                }
                break
            case .failure:
                print(myResponse.error!)
                break
            }
            
        }
    }
}
