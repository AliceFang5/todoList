//
//  TodoListTableViewController.swift
//  todoList
//
//  Created by 方芸萱 on 2020/8/14.
//

import UIKit
var todoList = [Todo]()

class TodoListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        todoList.append(Todo(item: "buy AAA", check: false))
        todoList.append(Todo(item: "buy BBB", check: false))
        todoList.append(Todo(item: "buy CCC", check: false))
        todoList.append(Todo(item: "buy DDD", check: false))
        todoList.append(Todo(item: "buy EEE", check: true))
        todoList.append(Todo(item: "buy FFF", check: false))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! todoTableViewCell

        // Configure the cell...
        cell.todo = todoList[indexPath.row]
        cell.update()
        
        return cell
    }
    
    @IBAction func addNewTodo(_ sender: UIBarButtonItem) {
        
        print("Add new item at row 0")
        todoList.insert(Todo(item: "New...", check: false), at: 0)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("didSelectRowAt \(indexPath.row)")
        todoList[indexPath.row].check = !todoList[indexPath.row].check
        tableView.reloadData()
    }
    
    @IBAction func finishEditTextController(_ sender: UITextField) {
        
        let point:CGPoint = sender.convert(.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point){
            print("finish edit row \(indexPath.row)")
            todoList[indexPath.row].item = sender.text!
            tableView.reloadData()
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("delete")
        if editingStyle == .delete {
            // Delete the row from the data source
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
