//
//  ViewController.swift
//  SampleReorder
//
//  Created by FoodStory on 19/4/2562 BE.
//  Copyright © 2562 FoodStory. All rights reserved.
//

import UIKit
import Reorder

class ViewController: UIViewController {
    var numberArr = (0...100).map { "indexPath is \($0)" }
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Table"
        setupReorderStyle()

    }
    private func setupReorderStyle(){
         self.tableview.reorderController.delegate = self
         self.tableview.reorderController.cellOpacity = 0.7
         self.tableview.reorderController.cellScale = 1.05
         self.tableview.reorderController.shadowOpacity = 0.5
         self.tableview.reorderController.shadowRadius = 20
         self.tableview.reorderController.shadowOffset = CGSize(width: 0, height: 10)
    }
}
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         // spacerCell for between drag
        if let spacerCell = tableView.reorderController.spacerCell(for: indexPath){
            return spacerCell
        }
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "\(numberArr[indexPath.row])"
            cell.selectionStyle = .none
            return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArr.count
    }
}
extension ViewController: TableViewReorderDelegate{

    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = numberArr[sourceIndexPath.row]
        numberArr.remove(at: sourceIndexPath.row)
        numberArr.insert(item, at: destinationIndexPath.row)
        
    }
    func tableView(_ tableView: UITableView, canReorderRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

