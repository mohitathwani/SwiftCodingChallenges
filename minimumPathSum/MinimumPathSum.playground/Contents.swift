//https://leetcode.com/problems/minimum-path-sum/description/
//Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
//
//Note: You can only move either down or right at any point in time.
//
//Example:
//
//Input:
//[
//[1,3,1],
//[1,5,1],
//[4,2,1]
//]
//Output: 7
//Explanation: Because the path 1→3→1→1→1 minimizes the sum.

func minPathSum(_ grid: [[Int]]) -> Int {
  var result = 0
  
  guard !grid.isEmpty else {
    return result
  }
  
  let numRows = grid.count
  let numCols = grid[0].count
  
  var dp = [[Int]](repeating: [Int](repeating: 0, count: numCols), count: numRows)
  
  for i in stride(from: numRows - 1, through: 0, by: -1) {
    for j in stride(from: numCols - 1, through: 0, by: -1) {
      
      if i + 1 < numRows && j + 1 < numCols {
        dp[i][j] = grid[i][j] + min(dp[i + 1][j], dp[i][j + 1])
      }
      else if i + 1 < numRows {
        dp[i][j] = grid[i][j] + dp[i + 1][j]
      }
      else if j + 1 < numCols {
        dp[i][j] = grid[i][j] + dp[i][j + 1]
      }
      else {
        dp[i][j] = grid[i][j]
      }
    }
  }
  
  result = dp[0][0]
  
  return result
}

//minPathSum([[1,3,1],[1,5,1],[4,2,1]])
//minPathSum([[1,3,4,8],[3,2,2,4],[5,7,1,9],[2,3,2,3]])
minPathSum([[1,2,5],[3,2,1]])
