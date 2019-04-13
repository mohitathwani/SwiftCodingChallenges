func print(board: inout [[Int]], n: Int) {
  for i in 0..<n {
    for j in 0..<n {
      print(board[i][j], separator: "", terminator: " ")
    }
    print()
  }
}
func isSafe(i: Int, j: Int, board: inout [[Int]], n: Int) -> Bool {
  //check row
  for col in stride(from: 0, to: j, by: 1) {
    if board[i][col] == 1 {
      return false
    }
  }
  
  //check left-up diagonal
  var row = i - 1
  var col = j - 1
  while row >= 0 && col >= 0 {
    if board[row][col] == 1 {
      return false
    }
    
    row = row - 1
    col = col - 1
  }
  
  //check left-down diagonal
  row = i + 1
  col = j - 1
  while row < n && col >= 0 {
    if board[row][col] == 1 {
      return false
    }
    
    row = row + 1
    col = col - 1
  }
  
  return true
}
func solve(n: Int) {
  if n == 0 {
    return
  }
  
  var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  
  func place(queen: Int, queenCount: Int) {
    if (queen > n) {
      return
    }
    if queenCount == n {
      print(board: &board, n: n)
      print("----")
      return
    }
    
    for i in 0..<n {
      if isSafe(i: i, j: queen, board: &board, n: n) {
        board[i][queen] = 1
        place(queen: queen + 1, queenCount: queenCount + 1)
        board[i][queen] = 0
      }
    }
  }
  
  place(queen: 0, queenCount: 0)
}

solve(n: 8)
