//
//  ViewController.swift
//  DangerTest
//
//  Created by kaique.magno.santos on 23/08/19.
//  Copyright © 2019 kaique.magno.santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outletTableView: UITableView!
    @IBOutlet var outletBackgroundView: UIView!
    @IBOutlet weak var outletBackgroundLabel: UILabel!
    
    let taskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.outletTableView.dataSource = self
        self.outletTableView.delegate = self
        self.outletTableView.tableFooterView = UIView()
        self.outletBackgroundLabel.text = "Não tem nada aqui"
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = taskManager.fetchTasks().count
        if count == 0 {
            self.outletTableView.backgroundView = self.outletBackgroundView
        }else{
            self.outletTableView.backgroundView = nil
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let task = taskManager.fetchTasks()[indexPath.row]
        
        cell.textLabel?.text = task.title
        
        if task.isCompleted {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
