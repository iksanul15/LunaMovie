//
//  main.swift
//  RotasiKiri
//
//  Created by Muhammad Iksanul on 04/10/20.
//

import Foundation

var arrayInt = [1,2,3,4,5,6,7,8,9]

func leftRotate(nums: [Int], numOfRotation: Int) {
    let modulo = numOfRotation % arrayInt.count
    
    if modulo == 0 {
        print(arrayInt)
        return
    }
    
    arrayInt = reverseArray(start: 0, end: arrayInt.count - 1 , array: arrayInt)
    
    arrayInt = reverseArray(start: 0, end: modulo - 1 , array: arrayInt)
    
    arrayInt = reverseArray(start: modulo, end: arrayInt.count - 1, array: arrayInt)
    
    print(arrayInt)
}

func reverseArray(start: Int, end: Int, array: [Int]) -> [Int] {
    var result = array
    var i = start
    var j = end
    while i < j {
        result.swapAt(i, j)
        i += 1
        j -= 1
    }
    
    return result
}

print("Insert number of rotate: ")
let numOfRotation = Int(readLine()!)

leftRotate(nums: arrayInt, numOfRotation: numOfRotation!)

