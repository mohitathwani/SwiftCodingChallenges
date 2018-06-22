//https://leetcode.com/problems/spiral-matrix/description/
//Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//
//Example 1:
//
//Input:
//[
//[ 1, 2, 3 ],
//[ 4, 5, 6 ],
//[ 7, 8, 9 ]
//]
//Output: [1,2,3,6,9,8,7,4,5]
//Example 2:
//
//Input:
//[
//[1, 2, 3, 4],
//[5, 6, 7, 8],
//[9,10,11,12]
//]
//Output: [1,2,3,4,8,12,11,10,9,5,6,7]

func processMatrix(_ matrix:[[Int]], rows: Int, columns: Int, start: Int, result:inout [Int]) {
  
  var idx = start
  
  //process first row
  while idx < start + columns {
    result.append(matrix[start][idx])
    idx += 1
  }
  
  //process right column
  idx = start + 1
  while idx < start + rows {
    result.append(matrix[idx][start + columns - 1])
    idx += 1
  }
  
  //process bottom row iff rows > 1
  if rows > 1 {
    idx = start + columns - 2
    while idx >= start {
      result.append(matrix[start + rows - 1][idx])
      idx -= 1
    }
  }
  
  //process left column iff columns > 1
  if columns > 1 {
    idx = start + rows - 2
    while idx >= start + 1 {
      result.append(matrix[idx][start])
      idx -= 1
    }
  }
}

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
  var result = [Int]()
  
  guard !matrix.isEmpty else {
    return result
  }
  
  var rows = matrix.count
  var columns = matrix[0].count
  var start = 0
  
  while rows > 0 && columns > 0 {
    processMatrix(matrix, rows: rows, columns: columns, start: start, result: &result)
    rows -= 2
    columns -= 2
    start += 1
  }
  
  return result
}

spiralOrder([[Int]]())
print(spiralOrder([[6,7]]))
print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
print(spiralOrder([[6],[7]]))
print(spiralOrder([[1,2,3], [4,5,6], [7,8,9], [10,11,12], [13,14,15]]))
