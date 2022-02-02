//
//  MenuVC.swift
//  iPong
//
//  Created by Kyle Feller on 1/26/22.
//

import Foundation
import UIKit





enum gameType {
    case easy
    case medium
    case hard
    case playerTwo
}


class MenuVC : UIViewController{

   
    
    @IBAction func PlayerTwo(_ sender: Any) {
        moveToGame(game: .playerTwo)
    }
    
    @IBAction func Easy(_ sender: Any) {
        moveToGame(game: .easy)
    }
    
    @IBAction func Medium(_ sender: Any) {
        moveToGame(game: .medium)
    }
    
    
    @IBAction func Hard(_ sender: Any) {
        moveToGame(game: .hard)
    }
    
    
    func moveToGame(game : gameType){
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
    }
    
}
