//
//  ViewController.swift
//  TicTacToe
//
//  Created by Максим Горячкин on 08.05.2023.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var reloadButton: UIButton!
    
    private var game = Game()
    
    @IBAction func action(_ sender: UIButton) {
        if game.isCross {
            game.crosses.append(sender.tag)
            prepareNextStep(text: "ZEROES GO",
                            imageName: game.crossImage,
                            array: game.crosses,
                            sender: sender)
        } else {
            game.zeroes.append(sender.tag)
            prepareNextStep(text: "CROSSES GO",
                            imageName: game.zeroImage,
                            array: game.zeroes,
                            sender: sender)
        }
        
        if game.crosses.count == 5 && game.isActive {
            canselGame(text: "NO WINNER!")
        }
    }
    
    @IBAction func reload() {
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.isEnabled = true
            button.setBackgroundImage(nil, for: .normal)
        }
        reloadButton.isHidden = true
        label.text = "CROSSES GO"
        game = Game()
    }
    
    private func prepareNextStep(text: String, imageName: String, array: [Int], sender: UIButton) {
        label.text = text
        sender.setBackgroundImage(UIImage(named: imageName), for: .normal)
        sender.isEnabled = false
        check(array: array)
        game.isCross.toggle()
    }
    
    private func check(array: [Int]) {
        if array.count == 3 {
            checkWin(array: array)
        } else if array.count == 4 {
            for i in 0..<array.count {
                var array = array
                array.remove(at: i)
                checkWin(array: array)
            }
        } else if array.count == 5 {
            for i in 0..<array.count {
                var array = array
                array.remove(at: i)
                for j in 0..<array.count {
                    var array = array
                    array.remove(at: j)
                    checkWin(array: array)
                }
            }
        }
    }
    
    private func checkWin(array: [Int]) {
        if game.winCombinations.contains(array.sorted()) && game.isCross {
            canselGame(text: "CROSSES WIN!")
        } else if game.winCombinations.contains(array.sorted()) {
            canselGame(text: "ZEROES WIN!")
        }
    }
    
    private func canselGame(text: String) {
        label.text = text
        game.isActive = false
        reloadButton.isHidden = false
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.isEnabled = false
        }
    }
}
