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
  for idx in start...start + columns - 2 {
    print("Loop 1")
    result.append(matrix[start][idx])
    print(result)
  }
  
//  if start + 1 < rows {
    for idx in start...rows - 2 {
      print("Loop 2")
      result.append(matrix[idx][columns - 1])
      print(result)
    }
//  }
  
  for idx in (start + 1...columns - 1).reversed() {
    print("Loop 3")
    result.append(matrix[rows - 1][idx])
    print(result)
  }
  
//  if start + 1 < rows {
    for idx in ((start + 1)...(rows - 1)).reversed() {
      print("Loop 4")
      result.append(matrix[idx][start])
      print(result)
//    }
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

//spiralOrder([[Int]]())
print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
