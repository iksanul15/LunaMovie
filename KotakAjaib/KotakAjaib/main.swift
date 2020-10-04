//
//  main.swift
//  KotakAjaib
//
//  Created by Muhammad Iksanul on 05/10/20.
//

import Foundation

var matrix = [
    [3, 1, 4],
    [4, 2, 7],
    [2, 5, 6]
]

func makeMagicSquare(matrix: [[Int]]) {
    
    var maxTotal = 0
    
    for row in matrix{
        let total = row.reduce(0, +)
        if total > maxTotal {
            maxTotal = total
        }
    }
    
    for i in 0..<matrix.count {
        var total = 0
        
        for j in 0..<matrix.count {
            total += matrix[j][i]
        }
        
        if total > maxTotal {
            maxTotal = total
        }
        
    }
    
    for i in 0..<matrix.count {
        var total = 0
        total += matrix[i][i]
        
        if total > maxTotal {
            maxTotal = total
        }
    }
    
    print(maxTotal)
    
    var newMatrix = [[Int]]()
    
    
    for _ in 0..<matrix.count{
        var rowOfMatrix = [Int]()
        
        for _ in 0..<matrix.count {
            rowOfMatrix.append(maxTotal/matrix.count)
        }
        
        newMatrix.append(rowOfMatrix)
    }
    
    for i in 0..<newMatrix.count{
        var sumOfRow = newMatrix[i].reduce(0, +)
        if sumOfRow != maxTotal {
            newMatrix[i][i] += maxTotal - sumOfRow
            sumOfRow = maxTotal
        }
    }
    
    
    
    for i in 0..<newMatrix.count{
        for j in 0..<newMatrix.count {
            print(newMatrix[i][j], terminator: " ")
        }
        print()
    }
}

makeMagicSquare(matrix: matrix)


