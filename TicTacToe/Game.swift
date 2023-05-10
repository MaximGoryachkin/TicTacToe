//
//  Model.swift
//  TicTacToe
//
//  Created by Максим Горячкин on 09.05.2023.
//

import Foundation

struct Game {
    let winCombinations = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    var crosses = [Int]()
    var zeroes = [Int]()
    var isCross = true
    var isActive = true
    let crossImage = "cross.png"
    let zeroImage = "zero.png"
}
