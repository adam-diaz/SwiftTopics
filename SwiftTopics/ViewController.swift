//
//  ViewController.swift
//  SwiftTopics
//
//  Created by Adam Diaz on 11/12/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets

    
    @IBOutlet weak var tableView: UITableView!
    
    let swiftTopics = ["Basic Operators", "Strings and Characters", "Collection Types", "Control Flow", "Functions",
    "Closures", "Enumerations", "Structures and Classes", "Properties", "Methods", "Subscripts",
    "Inheritance", "Initialization", "Deinitialization", "Optional Chaining", "Error Handling",
    "Type Casting", "Nested Types", "Extensions", "Protocols", "Generics", "Opaque Types",
    "Automatic Reference Counting", "Memory Safety", "Access Control", "Advanced Operators"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("prepare(for segue: )")
        
        guard let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        detailViewController.navigationItem.title =  swiftTopics[indexPath.row]
    }
    
    
}

extension ViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath)
        
        let swiftTopic = swiftTopics[indexPath.row]
        
        cell.textLabel?.text = swiftTopic
        
        return cell
    }
    
}
