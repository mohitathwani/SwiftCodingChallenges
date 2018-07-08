//https://leetcode.com/problems/word-search-ii/description/
//Given a 2D board and a list of words from the dictionary, find all words in the board.
//
//Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.
//
//Example:
//
//Input:
//words = ["oath","pea","eat","rain"] and board =
//[
//['o','a','a','n'],
//['e','t','a','e'],
//['i','h','k','r'],
//['i','f','l','v']
//]
//
//Output: ["eat","oath"]
//Note:
//You may assume that all inputs are consist of lowercase letters a-z.

func dfs(flights:[[Int]], days:[[Int]], currentCity: Int, currentWeek: Int) -> Int {
  if currentWeek == days[0].count {
    return 0
  }
  
  var maxVac = 0
  
  for i in 0..<flights.count {
    print(i,currentCity, currentWeek)
    if flights[currentCity][i] == 1 || i == currentCity {
      let vac = days[i][currentWeek] + dfs(flights: flights, days: days, currentCity: i, currentWeek: currentWeek + 1)
      maxVac = max(maxVac, vac)
    }
  }
  
  return maxVac
}

func maxVacationDays(_ flights: [[Int]], _ days: [[Int]]) -> Int {
  return dfs(flights: flights, days: days, currentCity: 0, currentWeek: 0)
}

maxVacationDays([[0,1,1],[1,0,1],[1,1,0]], [[1,3,1],[6,0,3],[3,3,3]])
