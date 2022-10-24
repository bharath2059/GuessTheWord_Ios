//
//  GameModel.swift
//  Guesstheword
//
//  Created by kartik soni on 2022-08-09.
//

import Foundation
class GameModel{
    var randomWord: String=""
    var usedWordsIndexes = [] as Array<Int>
    var noOfCorrectLetters = 0
    var whichRow : Int = 0
    var score :Int = 5
    var orderOfMoves = [String]()
    var isPastGame = false

    let allWords = ["hunch","quoit","gaurs","siped","stime","tirls","choky","tawse","rubel","spaed","taels","stoat","herms","roger","laths","etuis","argle","miter","heros","limpa","machs","slunk","radix","chufa","braky","covin","viler","nighs","baits","dandy","waxes","clots","hinge","rated","patio","oread","flota","flues","wiped","belay","aunts","among","sowar","perch","stoae","praos","shaft","joins","hired","gigot","kames","gonad","blush","youse","hempy","turfs","ruths","belga","sixmo","sexes","eagre","retia","shirk","gappy","wicks","invar","spent","emmet","uncia","ukase","drabs","scarf","crows","shaky","brier","jingo","nopal","coups","bogie","guilt","kagus","moped","laves","shote","agate","rajes","agist","tsadi","brood","mimeo","mutes","harls","mains","chute","mache","hutch","jupon","allod","piggy","fuzzy","sades","tawny","adoze","saury","setup","grimy","basil","hoyle","sered","caped","utter","thous","needs","glues","peens","tomes","sense","spado","phony","mixes","pipit","limba","iodid","bleep","tutus","perse","afore","speer","luaus","hears","laver","cuffs","huger","galop","schwa","byrls","teloi","mages","esnes","togae","madre","loids","skids","playa","yahoo","dirls","fetes","kists","dunts","speel","coude","pines","krait","coeds","teens","reset","roust","angst","tsked","junks","texas","lanky","sissy","tamal","atlas","rimed","baggy","lweis","elite","teles","blare","tired","major","blaze","ottar","litai","howes","shags","alibi","whort","pinto","lists","bipod","doing","halms","kicks","snots","reeds","maids","noses","druse","carbs","mucro","kempt","wooed","kroon","bares","poind","turks","leery","snook","ofter","lenes","clink","whish","vuggs","cable","gelds","manic","chyle","begin","trull","areae","award","troll","plead","talus","cluck","tidal","spile","tepal","sonic","durrs","tinct","maybe","askew","wormy","yogic","super","leafy","goofy","miles","mucks","ahead","power","pulpy","munis","fados","trois","unais","trued","halal","hasty","lamas","ebook","squat","grosz","holla","goers","hussy","mysid","piles","fiery","theme","yeggs","borty","wolfs","caked","sipes","dhaks","sling","comix","kaons","colby","womyn","kopje","cadge","faxes","quare","teind","azido","spiky","desks","wasps","rhino","wiles","jails","beams","monde","parge","reifs","afoot","rabic","sexto","reins","toady","sidhe","ancon","sorry","malls","spine","birle","begot","sodic","gavel","elegy","gazer","shoed","cadgy","asset","smaze","chuff","spews","roman","route","cased","facts","jerid","yearn","tabid","pipes","spiel","leech","roast","ebbed","getas","kepis","clout","sixty","mothy","abuzz","wines","foggy","ramie","taluk","danio","hosts","softy","wurst","hexes","limes","caeca","chess","bulla","arose","goads","quire","cobby","dines","seism","pyran","griff","raspy","coops","nonce","airth","troys","gummy","burst","mills","teeth","plain","diram","coles","curns","linin","crump","conus","seedy","lisle","frizz","nests","wooly","topic","puppy","pekoe","froes","cilia","runes","salvo","combe","bizes","mynas","borax","acnes","rungs","doges","axmen","husks","qaids","cease","spade","quern","nomas","dyads","prove","tinny","ovals","stuff","olden","atoll","swear","risen","icker","ninth","yeuks","ratal","frats","mosts","phyla","wyted","slain","bosom","soots","hotch","optic","mincy","yawls","myope","yeses","trait","epact","zayin","matts","helps","brows","sells","swink","deans","gavot","nuked","magma","rowen","masks","ariel","butut","court","plebs","durst","nerol","novas","narks","cooee","kalif","pated","ports","pimps","clamp","kings","puled","could","crisp","neves","twyer","balds","vexil","mazed","tolyl","hides","credo","hight","pansy","might","unbar","shoos","foins","prang","bilby","nills","prate","tiros","mojos","sheaf","mooed","sneap","summa","frank","stymy","renew","cooed","tepas","joist","lands","fleet","faked","ferly","pumas","wires","daily","frame","septa","refry","diode","cruck","swank","fenny","brand","noose"]
    
    func getRandomWord ()->String   {
        let randomIndex = Int.random(in: 0..<allWords.count)
        randomWord = generateNewRandomWord(index: randomIndex)
        print(randomWord)
        return randomWord
    }
    func generateNewRandomWord(index: Int) -> String {
        
       
        let randomWord = allWords[index]
        if !usedWordsIndexes.contains(index) {
            usedWordsIndexes.append(index)
            return randomWord
        }
        else {
            let randomIndex = Int.random(in: 0..<allWords.count)
            return generateNewRandomWord(index: randomIndex)
        }
    }
    
    
    func isGameFinished()->Bool {
        if(noOfCorrectLetters == 5){
            return true
        } else if(whichRow == 25){
            return true
        }
        return false
    }
    
    func saveGame(){
        
        if (isPastGame){
            return
        }
        
        let numGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        let gameNumber = numGamesPlayed + 1
        UserDefaults.standard.set(score, forKey: Constants.SCORE + String(gameNumber))
        UserDefaults.standard.set(Date(), forKey: Constants.DATE_TIME + String(gameNumber))
        UserDefaults.standard.set(orderOfMoves, forKey: Constants.ORDER_OF_MOVES + String(gameNumber))
        UserDefaults.standard.set(gameNumber, forKey: Constants.NUM_GAMES )
        print("game saved")
    }
    
    
  
}
struct Constants{
    static let NUM_GAMES = "numberOfGamesPlayed"
    static let SCORE = "score"
    static let DATE_TIME="datetime"
    static let ORDER_OF_MOVES = "orderOfMoves"
}

