//https://leetcode.com/problems/word-search/description/
//Given a 2D board and a word, find if the word exists in the grid.
//
//The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
//
//Example:
//
//board =
//[
//['A','B','C','E'],
//['S','F','C','S'],
//['A','D','E','E']
//]
//
//Given word = "ABCCED", return true.
//Given word = "SEE", return true.
//Given word = "ABCB", return false.

func dfs(i: Int, j: Int, index: Int, chars: [Character], board:[[Character]], map:inout [[Bool]]) -> Bool {
  let topRow = i - 1
  let bottomRow = i + 1
  let leftColumn = j - 1
  let rightColumn = j + 1
  
  let numRows = board.count
  let numCols = board[0].count
  
  let isLastChar = index == chars.count - 1
  
//  if isLastChar {
//    print(board[i][j], i, j, index)
//    return board[i][j] == chars[index]
//  }
  
  print("At index \(index)")
  if topRow >= 0 && !map[topRow][j] && !isLastChar && board[topRow][j] == chars[index + 1] {
    map[topRow][j] = true
    let result = dfs(i: topRow, j: j, index: index + 1, chars: chars, board: board, map: &map)
    if result == true {
      return true
    }
    map[topRow][j] = false
  }
  
  if bottomRow < numRows && !map[bottomRow][j] && !isLastChar && board[bottomRow][j] == chars[index + 1] {
    let result = dfs(i: bottomRow, j: j, index: index + 1, chars: chars, board: board, map: &map)
    if result == true {
      return true
    }
    map[bottomRow][j] = false
  }
  
  if leftColumn >= 0 && !map[i][leftColumn] && !isLastChar && board[i][leftColumn] == chars[index + 1] {
    let result = dfs(i: i, j: leftColumn, index: index + 1, chars: chars, board: board, map: &map)
    if result == true {
      return true
    }
    map[i][leftColumn] = false
  }
  
  if rightColumn < numCols && !map[i][rightColumn] && !isLastChar && board[i][rightColumn] == chars[index + 1] {
    let result = dfs(i: i, j: rightColumn, index: index + 1, chars: chars, board: board, map: &map)
    if result == true {
      return true
    }
    map[i][rightColumn] = false
  }
  
  return false
}

func exist(_ board: [[Character]], _ word: String) -> Bool {
  
  let numRows = board.count
  let numCols = numRows > 0 ? board[0].count : 0
  let chars = Array(word)
  
  if numRows == 0 || numCols == 0 || word.isEmpty{
    return false
  }
  
  if word.count >  numRows * numCols {
    return false
  }
  
  var map = board.map { (row) -> [Bool] in
    row.map({ (c) -> Bool in
      return false
    })
  }
  
  for i in stride(from: 0, to: numRows, by: 1) {
    for j in stride(from: 0, to: numCols, by: 1) {
      if board[i][j] == chars[0] {
        map[i][j] = true
        let result = dfs(i: i, j: j, index: 0, chars: chars, board: board, map: &map)
        if result == true {
          return true
        }
        map[i][j] = false
      }
    }
  }
  return false
}

//exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")
//exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE")
exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")
