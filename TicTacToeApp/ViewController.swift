//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Mahmut Senbek on 8.12.2022.
//

import UIKit

class ViewController: UIViewController {

    enum Turn {
        case Circular
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
    
    var CIRCULAR = "O"
    var CROSS = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        addToBoard(sender)
    }
    
    
    func addToBoard(_ sender: UIButton) {
        
        if sender.title(for: .normal) == nil {
            if currentTurn == Turn.Circular {
                sender.setTitle(CIRCULAR, for: UIControl.State.normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            }else if  currentTurn == Turn.Cross {
                sender.setTitle(CROSS, for: UIControl.State.normal)
                currentTurn = Turn.Circular
                turnLabel.text = CIRCULAR
            }
            
            sender.isEnabled = false
        }
        
    }
    

}

