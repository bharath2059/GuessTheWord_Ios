//
//  newGameControllerViewController.swift
//  Guesstheword
//
//  Created by kartik soni on 2022-08-08.
//

import UIKit

class newGameControllerViewController: UIViewController, UITextFieldDelegate {
    
    
    let gameModel = GameModel();
    var randomWordGenerated : String = ""
    var listOfTextFields = [UITextField]()
    var pastGameData : GameData?
    var replayingPastGame = false

    

    
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!
    @IBOutlet weak var tf7: UITextField!
    @IBOutlet weak var tf8: UITextField!
    @IBOutlet weak var tf9: UITextField!
    @IBOutlet weak var tf10: UITextField!
    @IBOutlet weak var tf11: UITextField!
    @IBOutlet weak var tf12: UITextField!
    @IBOutlet weak var tf13: UITextField!
    @IBOutlet weak var tf14: UITextField!
    @IBOutlet weak var tf15: UITextField!
    @IBOutlet weak var tf16: UITextField!
    @IBOutlet weak var tf17: UITextField!
    @IBOutlet weak var tf18: UITextField!
    @IBOutlet weak var tf19: UITextField!
    @IBOutlet weak var tf20: UITextField!
    @IBOutlet weak var tf21: UITextField!
    @IBOutlet weak var tf22: UITextField!
    @IBOutlet weak var tf23: UITextField!
    @IBOutlet weak var tf24: UITextField!
    @IBOutlet weak var tf25: UITextField!
    
    @IBOutlet weak var gameState: UILabel!
    
    
    
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      //  Do any additional setup after loading the view.
    
        tf1.delegate = self
        listOfTextFields.append(tf1)
        tf2.delegate = self
        listOfTextFields.append(tf2)
        tf3.delegate = self
        listOfTextFields.append(tf3)
        tf4.delegate = self
        listOfTextFields.append(tf4)
        tf5.delegate = self
        listOfTextFields.append(tf5)
        tf6.delegate = self
        listOfTextFields.append(tf6)
        tf7.delegate = self
        listOfTextFields.append(tf7)
        tf8.delegate = self
        listOfTextFields.append(tf8)
        tf9.delegate = self
        listOfTextFields.append(tf9)
        tf10.delegate = self
        listOfTextFields.append(tf10)
        tf11.delegate = self
        listOfTextFields.append(tf11)
        tf12.delegate = self
        listOfTextFields.append(tf12)
        tf13.delegate = self
        listOfTextFields.append(tf13)
        tf14.delegate = self
        listOfTextFields.append(tf14)
        tf15.delegate = self
        listOfTextFields.append(tf15)
        tf16.delegate = self
        listOfTextFields.append(tf16)
        tf17.delegate = self
        listOfTextFields.append(tf17)
        tf18.delegate = self
        listOfTextFields.append(tf18)
        tf19.delegate = self
        listOfTextFields.append(tf19)
        tf20.delegate = self
        listOfTextFields.append(tf20)
        tf21.delegate = self
        listOfTextFields.append(tf21)
        tf22.delegate = self
        listOfTextFields.append(tf22)
        tf23.delegate = self
        listOfTextFields.append(tf23)
        tf24.delegate = self
        listOfTextFields.append(tf24)
        tf25.delegate = self
        listOfTextFields.append(tf25)

        
        
        if(replayingPastGame){
            navigationItem.title = "Past Game"
            gameModel.isPastGame = true
            for j in 0...24 {
                listOfTextFields[j].isUserInteractionEnabled = false
            }

            var i = 0
            let pastGameLetters = pastGameData?.orderOfMoves
            
            var delay : Double = 0.0
            for letter in pastGameLetters! {
                delay += 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + delay ,execute: {
                    self.listOfTextFields[i].text = letter
                i += 1
                })
                gameState.text = "Game Over"
            }
            
        }else{
            randomWordGenerated = gameModel.getRandomWord()
             print(randomWordGenerated)
        }
    }
    

    
    func checkIfCharInArray(char: Character, index: Int, field : UITextField) {
        let wordArr = Array(randomWordGenerated)
        if (wordArr.contains(char) && wordArr[index] == char) {
            field.backgroundColor = .green
            gameModel.noOfCorrectLetters = gameModel.noOfCorrectLetters + 1
            print("correct")
        } else if (wordArr.contains(char)) {
            field.backgroundColor = .yellow
            print("Wrong position")
        } else {
            field.backgroundColor = .red
            print("wrong")
        }
    }
    
    
    @IBAction func result(_ sender: UIButton) {
        if(gameModel.isGameFinished() && replayingPastGame){
            return
        }
        if(listOfTextFields[gameModel.whichRow].text != "" && listOfTextFields[gameModel.whichRow + 1].text != "" && listOfTextFields[gameModel.whichRow + 2].text != "" && listOfTextFields[gameModel.whichRow + 3].text != "" && listOfTextFields[gameModel.whichRow + 4].text != "") {
            checkIfCharInArray(char: Character(listOfTextFields[gameModel.whichRow].text!), index: 0, field: listOfTextFields[gameModel.whichRow])
            gameModel.orderOfMoves.append(listOfTextFields[gameModel.whichRow].text!)
            checkIfCharInArray(char: Character(listOfTextFields[gameModel.whichRow + 1].text!), index: 1, field: listOfTextFields[gameModel.whichRow + 1])
            gameModel.orderOfMoves.append(listOfTextFields[gameModel.whichRow + 1].text!)
            checkIfCharInArray(char: Character(listOfTextFields[gameModel.whichRow + 2].text!), index: 2, field: listOfTextFields[gameModel.whichRow + 2])
            gameModel.orderOfMoves.append(listOfTextFields[gameModel.whichRow + 2].text!)
            checkIfCharInArray(char: Character(listOfTextFields[gameModel.whichRow + 3].text!), index: 3, field: listOfTextFields[gameModel.whichRow + 3])
            gameModel.orderOfMoves.append(listOfTextFields[gameModel.whichRow + 3].text!)
            checkIfCharInArray(char: Character(listOfTextFields[gameModel.whichRow + 4].text!), index: 4, field: listOfTextFields[gameModel.whichRow + 4])
            gameModel.orderOfMoves.append(listOfTextFields[gameModel.whichRow + 4].text!)
            gameModel.whichRow = gameModel.whichRow + 5
            
            if(gameModel.isGameFinished()){
                gameModel.saveGame()
                for j in 0...24 {
                    listOfTextFields[j].isUserInteractionEnabled = false
                }
                
                if(gameModel.score > 1){
                    gameState.text = "Congratulations, You won."
                    score.text = "Your Score is " + String(gameModel.score)
                }else{
                    gameState.text = "Better Luck Next Time. The Actual Word is : " + randomWordGenerated
                }
                
            }
            else{
                gameModel.score = gameModel.score-1
                print(gameModel.score)
                gameModel.noOfCorrectLetters = 0
            }
         }
        
    
        
    }
    
   
    
    
    
    
    
    
    
    
   
    
  //  MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
    
}

    

