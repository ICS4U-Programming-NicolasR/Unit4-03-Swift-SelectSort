//
// SelectSort.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-05-16
//  Version 1.0
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Sorts with select sort
import Foundation

func insertSort(_ array: [Int]) -> [Int] {
    var arraySorted = array
    for counter in 0..<arraySorted.count {
        var minIndex = counter
        for counter2 in counter + 1..<arraySorted.count where
        arraySorted[counter2] < arraySorted[minIndex] {
            minIndex = counter2
        }
        // swap the two indexes
        arraySorted.swapAt(counter, minIndex)
    }
    return arraySorted
}

// Set the input and output file paths
let inputFilePath = "input.txt"
let outputFilePath = "output.txt"

// Read input from file
if let inputFile = try? String(contentsOfFile: inputFilePath) {
    let lines = inputFile.components(separatedBy: "\n")

    // Process each line
    var answers = [String]()
    for line in lines {
        if line.isEmpty {
            // Skip processing if line is empty
            answers.append("Invalid input:Empty value")
            continue
        }
        let numbers = line.split(separator: " ").compactMap { str -> Int? in
            if str.isEmpty {
                answers.append("Invalid input: Empty value")
                return nil
            } else if let number = Int(str) {
                return number
            } else {
                answers.append("Invalid input: \(str)")
                return nil
            }
        }
        // Sort the numbers using insert sort
        let sorted = insertSort(numbers)
        // Write the sorted array to the output file
        let sortedArray = "Your array sorted is \(sorted)"
        answers.append(sortedArray)
    }
    // Write output to file
    let outputString = answers.joined(separator: "\n")
    do {
        try outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file: \(error)")
    }
} else {
    print("File not found or unable to read input file")
}
