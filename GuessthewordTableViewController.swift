//
//  GuessthewordTableViewController.swift
//  Guesstheword
//
//  Created by kartik soni on 2022-08-03.
//

import UIKit

class GuessthewordTableViewController: UITableViewController {

    var gameDataArray = [GameData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        tableView.reloadData()
    }


    // MARK: - Table view data source
    func loadData(){
        let numberOfGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        gameDataArray = [GameData]()
        for i in(0..<numberOfGamesPlayed).reversed(){
            let gameNumber = i + 1
            
            let score = UserDefaults.standard.integer(forKey: Constants.SCORE + String(gameNumber))
            let dateTimeThisGame = UserDefaults.standard.object(forKey: Constants.DATE_TIME + String(gameNumber)) as! Date
            let orderOfMovesThisGame = UserDefaults.standard.array(forKey: Constants.ORDER_OF_MOVES + String(gameNumber)) as!  [String]
            
            let thisGameData = GameData(score:score, dateTime: dateTimeThisGame,orderOfMoves: orderOfMovesThisGame)
            gameDataArray.append(thisGameData)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Guessthewordtablecell", for: indexPath) as! GuessthewordTableViewCell

        
        let rowNumber = indexPath.row
        let thisRowData = gameDataArray[rowNumber]
        // Configure the cell...
        if(thisRowData.score == 1){
        cell.whoWon.text = "Lost"
        }
        else{
            cell.whoWon.text = "Score :" + String(thisRowData.score)
        }
        if(thisRowData.score == 1){
            cell.winLossImage.image = UIImage(named: "green_loss")
        }
        else{
            cell.winLossImage.image = UIImage(named: "green_win")
        }
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
         
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        print(dateFormatter.string(from: thisRowData.dateTime)) // Jan 2, 2001
        cell.dateTimeLabel.text = dateFormatter.string(from: thisRowData.dateTime)
        
           cell.gameData = thisRowData
           return cell

       
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
  //  MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
          
          
          let identifier = segue.identifier

          if(identifier=="newGame"){

              return
          }
            let whichCell = sender as!  GuessthewordTableViewCell
             let destinationView = segue.destination as! newGameControllerViewController
              destinationView.replayingPastGame = true
              destinationView.pastGameData = whichCell.gameData
      }
}
    



struct GameData{
    var score :Int
    var dateTime : Date
    var orderOfMoves : [String]
}
