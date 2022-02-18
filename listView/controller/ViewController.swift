//
//  ViewController.swift
//  listView
//
//  Created by helloKaviraj MBP on 17/02/22.
//

import UIKit

class ViewController: UIViewController {
    let parser = Parser()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.parse()
    }
    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Display data in table view once it loads and give count property to members
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Display data in table view
        //cell.textLabel?.text = ;
        return cell
    }


}
