// IDAE: To answer the problem, we may use the mathematical formula for the sum of the first n+1 natural integers.
// To find the missing number in an array of n unique numbers ranging from 1 to n+1, compare the predicted sum to
// the actual sum of the items.

// FUNCTION: Find missing number in an array
func findMissingNumber(_ numbers: [Int]) -> Int {
    let n = numbers.count + 1
    let expectedSum = n * (n + 1) / 2       // Sum of expected numbers from 1 to n + 1
    let actualSum = numbers.reduce(0, +)    // Sum of actual numbers in the array
    return expectedSum - actualSum
}

let numbers_1 = [1,4,5,7,8,9,3,6,10]
let numbers_2 = [3,7,1,2,6,4]
let missingNumber1 = findMissingNumber(numbers_1)
print("\(missingNumber1)")
let missingNumber2 = findMissingNumber(numbers_2)
print("\(missingNumber2)")
