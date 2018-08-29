//868

func transpose(_ A: [[Int]]) -> [[Int]] {
  var result = [[Int]](repeating: [Int](repeating: 0, count: A.count), count: A[0].count)
  
  for i in stride(from: 0, to: A.count, by: 1) {
    for j in stride(from: 0, to: A[0].count, by: 1) {
      result[j][i] = A[i][j]
    }
  }
  
  return result
}

transpose([[1,2,3],[4,5,6]])
