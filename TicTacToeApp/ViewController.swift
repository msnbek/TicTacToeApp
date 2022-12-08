//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Mahmut Senbek on 8.12.2022.
//

import UIKit

class ViewController: UIViewController {

    enum Turn {
        case Nought
        case Cross
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1Btn: UIButton!
    @IBOutlet weak var a2Btn: UIButton!
    @IBOutlet weak var a3Btn: UIButton!
    @IBOutlet weak var b1Btn: UIButton!
    @IBOutlet weak var b2Btn: UIButton!
    @IBOutlet weak var b3Btn: UIButton!
    @IBOutlet weak var c1Btn: UIButton!
    @IBOutlet weak var c2Btn: UIButton!
    @IBOutlet weak var c3Btn: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    
    var noughtsScore = 0
    var crossesScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    func initBoard()
    {
        board.append(a1Btn)
        board.append(a2Btn)
        board.append(a3Btn)
        board.append(b1Btn)
        board.append(b2Btn)
        board.append(b3Btn)
        board.append(c1Btn)
        board.append(c2Btn)
        board.append(c3Btn)
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if checkForVictory(CROSS)
        {
            crossesScore += 1
            resultAlert(title: "Crosses Win!")
        }
        
        if checkForVictory(NOUGHT)
        {
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
        }
        
        if(fullBoard())
        {
            resultAlert(title: "Draw")
        }
        
        addToBoard(sender)
    }
    func checkForVictory(_ s :String) -> Bool
    {
        // Horizontal Victory
        if thisSymbol(a1Btn, s) && thisSymbol(a2Btn, s) && thisSymbol(a3Btn, s)
        {
            return true
        }
        if thisSymbol(b1Btn, s) && thisSymbol(b2Btn, s) && thisSymbol(b3Btn, s)
        {
            return true
        }
        if thisSymbol(c1Btn, s) && thisSymbol(c2Btn, s) && thisSymbol(c3Btn, s)
        {
            return true
        }
        
        // Vertical Victory
        if thisSymbol(a1Btn, s) && thisSymbol(b1Btn, s) && thisSymbol(c1Btn, s)
        {
            return true
        }
        if thisSymbol(a2Btn, s) && thisSymbol(b2Btn, s) && thisSymbol(c2Btn, s)
        {
            return true
        }
        if thisSymbol(a3Btn, s) && thisSymbol(b3Btn, s) && thisSymbol(c3Btn, s)
        {
            return true
        }
        
        // Diagonal Victory
        if thisSymbol(a1Btn, s) && thisSymbol(b2Btn, s) && thisSymbol(c3Btn, s)
        {
            return true
        }
        if thisSymbol(a3Btn, s) && thisSymbol(b2Btn, s) && thisSymbol(c1Btn, s)
        {
            return true
        }
        
        return false
    }
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String)
    {
        let message = "\nNoughts " + String(noughtsScore) + "\n\nCrosses " + String(crossesScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard()
    {
        for button in board
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought
        {
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        }
        else if firstTurn == Turn.Cross
        {
            firstTurn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool
    {
        for button in board
        {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    func addToBoard(_ sender: UIButton) {
        
        if sender.title(for: .normal) == nil {
            if currentTurn == Turn.Nought {
                sender.setTitle(NOUGHT, for: UIControl.State.normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            }else if  currentTurn == Turn.Cross {
                sender.setTitle(CROSS, for: UIControl.State.normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            }
            
            sender.isEnabled = false
        }
        
    }
    

}

