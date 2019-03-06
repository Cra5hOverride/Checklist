//
//  AddItemViewController.swift
//  Checklist
//
//  Created by student on 20/2/2562 BE.
//  Copyright © 2562 Override. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func AddItemViewControllerDidCancel(_ controller:AddItemViewController)
    func AddItemViewController(_ controller: AddItemViewController,didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    weak var delegate: AddItemViewControllerDelegate?
    @IBOutlet weak var input : UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        input.becomeFirstResponder()

    }
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    @IBAction func camcel(){
        delegate?.AddItemViewControllerDidCancel(self)
//        navigationController?.popViewController(animated: true)
    }
    @IBAction func done(){
        let item = ChecklistItem()
        item.text = input.text!
        
        delegate?.AddItemViewController(self, didFinishAdding: item)
        
//        let textInput = input.text! as! String
//        let checklist = self.navigationController?.viewControllers[0] as! ChecklistViewController
//        checklist.addItem(Text: textInput)
//        navigationController?.popViewController(animated: true)
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return nil
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.done()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty{
            doneBarButton.isEnabled = false
        }
        else{
            doneBarButton.isEnabled = true
        }
        return true
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
