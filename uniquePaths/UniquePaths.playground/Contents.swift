//https://leetcode.com/problems/unique-paths/
//A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
//
//The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
//
//How many possible unique paths are there?
//
//
//Above is a 7 x 3 grid. How many possible unique paths are there?
//
//Note: m and n will be at most 100.
//
//Example 1:
//
//Input: m = 3, n = 2
//Output: 3
//Explanation:
//From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
//1. Right -> Right -> Down
//2. Right -> Down -> Right
//3. Down -> Right -> Right
//Example 2:
//
//Input: m = 7, n = 3
//Output: 28

func uniquePaths(_ m: Int, _ n: Int) -> Int {
  var count = 0
  
  let startI = 0
  let startJ = 0
  
  func compute(i: Int, j: Int) {
    print(i, j)
    if i == m - 1 && j == n - 1 {
      count += 1
      return
    }
    
    if canGoRight(from: i, j: j) {
      compute(i: i, j: j + 1)
    }
    
    if canGoDown(from: i, j: j) {
      compute(i: i + 1, j: j)
    }
    
  }
  
  func canGoRight(from i: Int, j: Int) -> Bool{
    return j + 1 < n
  }
  
  func canGoDown(from i: Int, j: Int) -> Bool {
    return i + 1 < m
  }
  
  compute(i: startI, j: startJ)
  return count
}

uniquePaths(3, 6)

func uniquePathsDP(_ i: Int, _ j: Int) -> Int {
  guard i > 0 && j > 0 else {
    return 0
  }
  
  if i == 1 || j == 1 {
    return 1
  }
  
  var arr = [[Int]](repeating: [Int](repeating: 0, count: j), count: i)
  
  for x in 1...i-1 {
    arr[x][0] = 1
  }
  
  for x in 1...j-1 {
    arr[0][x] = 1
  }
  
  for y in 1...j-1 {
    for x in 1...i-1 {
      arr[x][y] = arr[x-1][y] + arr[x][y-1]
    }
  }
  
  return arr[i - 1][j - 1]
}

uniquePathsDP(2, 1)
//0 1 1 1  1  1  1
//1 2 3 4  5  6  7
//1 3 6 10 15 21 28
