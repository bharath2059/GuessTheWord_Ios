//
//  GuessthewordTableViewCell.swift
//  Guesstheword
//
//  Created by kartik soni on 2022-08-03.
//

import UIKit

class GuessthewordTableViewCell: UITableViewCell {
    
    var gameData : GameData?

    //Mark - Outlets
    
    
    @IBOutlet weak var winLossImage: UIImageView!
    
    @IBOutlet weak var whoWon: UILabel!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
