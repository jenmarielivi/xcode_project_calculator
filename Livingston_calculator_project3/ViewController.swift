//
//  ViewController.swift
//  Livingston_calculator_project3
//
//  Created by Consultant on 7/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    
    var workings: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }

    func clearAll(){
        workings = ""
        calculatorResults.text = ""
        calculatorWorkings.text = ""
        // reverts screen back to empty text
    }
    
    
    
    @IBAction func allClear(_ sender: Any) {
        clearAll() // will revert text space back to empty text once the AC button is tapped
    }
    
    
    // this is where all the math magic happens
   
    @IBAction func equals_btn(_ sender: Any) {
      
        
        if validInput(){
        //check for percentage working -- min 7:45
        let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
    
        let expression = NSExpression(format: checkedWorkingsForPercent)
        
        // returns the string into a double.
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        
        //figure out coding here. what does it do? why does it work
        let resultString = formatResults(result: result)// min 7:04
        calculatorResults.text = resultString
        }// end of if validInput()
        else{
            // give some sort of alert letting the user know its an invalid input
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "cannot do math based on provide inputs",// -- min 8:16
                preferredStyle: .alert)// end of UIAlertController
            
            
    alert.addAction(UIAlertAction(title: "Okay", style: .default)) // adds an action to the alert
            
   
        self.present(alert, animated: true, completion: nil)
        }
        
    
    }// end of equls_btn
    
    func validInput() -> Bool{
        var previous: Int = -1 // syntax has to be Int(space)=(space)-1
        var count = 0
        var funCharIndexes = [Int]()
        
        
        
        for char in workings{
            if(specialCharacter(char: char)){
                funCharIndexes.append(count) // this used when multiple operators
            }
            count += 1
        }
        
        
        for index in funCharIndexes{// min 9:30
            if(index == 0){
                return false
            }
            
            if(index == workings.count - 1){
                return false
            }
            
            
            
            if(previous != -1){
                    if(index - previous == 1){
                        return false
                    }
                }// end of if(previous != -1
            previous = index
            
        }// end of for index in funCharIndexes
        
        
           
            
        
        return true
    }// end of func validInput()
    
    func specialCharacter (char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "*"){
            return true
        }
        else{
            return false
        }
    }// end of func specialCharacter
    
    
    func formatResults(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }// end of first if statement
        else{
            return String(format: "%.2f", result)
        }// ene of else statement
    }// end of formatResults
   
    @IBAction func backTap(_ sender: Any) {
        addToWorkings(value: "+/-") // temporary placeholder
    }
    
    // addToWorkings displays the value onto screen
    func addToWorkings(value: String){
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    //--------   Non-numbers below +, -, *, /, %, .
    
    @IBAction func percentage_btn(_ sender: Any) {
            addToWorkings(value: "%")
        }
        
        
        @IBAction func divide_btn(_ sender: Any) {
            addToWorkings(value: "/")
        }
        
        
        @IBAction func multiply_btn(_ sender: Any) {
            addToWorkings(value: "*")
        }
        
        
        @IBAction func subtract_btn(_ sender: Any) {
            addToWorkings(value: "-")
        }
        
        
        @IBAction func add_btn(_ sender: Any) {
            addToWorkings(value: "+")
        }

        
        @IBAction func decimal_btn(_ sender: Any) {
            addToWorkings(value: ".")
    }


    
    
    // --------       Numbers below
    
    @IBAction func btn_zero(_ sender: Any) {
                addToWorkings(value: "0")
        }
        
       
   
    @IBAction func one(_ sender: Any) { //naming this btn_one resulted in a 12. or a crash.
        addToWorkings(value: "1")
    }
    
        @IBAction func btn_two(_ sender: Any) {
                addToWorkings(value: "2")
        }
        
        
        @IBAction func btn_three(_ sender: Any) {
                addToWorkings(value: "3")
        }
        
        @IBAction func btn_four(_ sender: Any) {
                addToWorkings(value: "4")
        }
        
        
        @IBAction func btn_five(_ sender: Any) {
                addToWorkings(value: "5")
        }
        
        
        @IBAction func btn_six(_ sender: Any) {
                addToWorkings(value: "6")
        }
        
        @IBAction func btn_seven(_ sender: Any) {
                addToWorkings(value: "7")
        }
        
        
        @IBAction func btn_eight(_ sender: Any) {
                addToWorkings(value: "8")
        }
        
        
        @IBAction func btn_nine(_ sender: Any) {
                addToWorkings(value: "9")
        }
        
}





