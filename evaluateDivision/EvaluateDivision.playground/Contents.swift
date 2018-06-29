//https://leetcode.com/problems/evaluate-division/description/
//Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much waterEquations are given in the format A / B = k, where A and B are variables represented as strings, and k is a real number (floating point number). Given some queries, return the answers. If the answer does not exist, return -1.0.
//
//Example:
//Given a / b = 2.0, b / c = 3.0.
//queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ? .
//return [6.0, 0.5, -1.0, 1.0, -1.0 ].
//
//The input is: vector<pair<string, string>> equations, vector<double>& values, vector<pair<string, string>> queries , where equations.size() == values.size(), and the values are positive. This represents the equations. Return vector<double>.
//
//According to the example above:
//
//equations = [ ["a", "b"], ["b", "c"] ],
//values = [2.0, 3.0],
//queries = [ ["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"] ].
//The input is always valid. You may assume that evaluating the queries will result in no division by zero and there is no contradiction.

func generateMap(equations: [[String]]) -> [String : Int] {
  var index = 0
  var map = [String:Int]()
  
  for pair in equations {
    let firstElement = pair[0]
    let secondElement = pair[1]
    if map[firstElement] == nil {
      map[firstElement] = index
      index += 1
    }
    
    if map[secondElement] == nil {
      map[secondElement] = index
      index += 1
    }
  }
  
  return map
}

func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
  
  var result = [Double]()
  
  guard equations.count != 0 || queries.count != 0 else {
    return result
  }
  
  let map = generateMap(equations: equations)
  
  var table = [[Double]](repeating: [Double](repeating: -1, count: map.count), count: map.count)
  
  for i in stride(from: 0, to: equations.count, by: 1) {
    let pair = equations[i]
    let firstElement = pair[0]
    let secondElement = pair[1]
    
    let firstIndex = map[firstElement]!
    let secondIndex = map[secondElement]!
    
    table[firstIndex][secondIndex] = values[i];
    table[secondIndex][firstIndex] = 1 / values[i];
    
    table[firstIndex][firstIndex] = 1
    table[secondIndex][secondIndex] = 1
  }
  
  for i in stride(from: 0, to: map.count, by: 1) {
    for j in stride(from: 0, to: map.count, by: 1) {
      if table[i][j] != -1 {
        continue
      }
      print(i,j)
    }
  }
  return result
}

calcEquation([["a", "b"], ["b","c"]], [2,3], [["a","c"], ["b", "a"]])
