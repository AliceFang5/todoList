//
//  todoTableViewCell.swift
//  todoList
//
//  Created by 方芸萱 on 2020/8/14.
//

import UIKit

class todoTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var editText: UITextField!
    
    var todo:Todo!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(){
        itemLabel.isHidden = false
        editText.isHidden = true
        itemLabel.text = todo.item
        if todo.check{
            accessoryType = .checkmark
        }else{
            accessoryType = .none
        }
        return
    }
    
    @IBAction func editTodo(_ sender: Any) {
        print("edit todo: \(todo.item)")
        itemLabel.isHidden = true
        editText.isHidden = false
        editText.text = todo.item
    }

}
