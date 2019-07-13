//a -> f
//b -> f
//c -> d
//d -> a b
//f -> NULL

//  a -> f   e-->g
//  ^    ^
//  |    |
//  |--->b
//  d <--c


var dependencyMap = [Character:[Character]]()
dependencyMap["d"] = ["a", "b"]
dependencyMap["b"] = ["f"]
dependencyMap["a"] = ["f", "d"]
dependencyMap["c"] = ["d"]
dependencyMap["f"] = []
dependencyMap["e"] = ["g"]
dependencyMap["g"] = []

enum MyError: Error {
  case NotPossible
}
func buildOrder(dependencyMap: [Character:[Character]]) throws -> [Character] {
  var order = [Character]()
  var startingNodes = Set<Character>(dependencyMap.keys)
  var completedNodes = Set<Character>()
  var visitedNodes = Set<Character>()
  
  for (_, array) in dependencyMap {
    for node in array {
      startingNodes.remove(node)
    }
  }
  
  func dfs(startNode: Character) throws {
    if visitedNodes.contains(startNode) {
      throw MyError.NotPossible
    }
    
    guard let dependants = dependencyMap[startNode] else {
      return
    }
    
    visitedNodes.insert(startNode)
    
    for dependant in dependants {
      if completedNodes.contains(dependant) {
        continue
      }
      
      try dfs(startNode: dependant)
    }
    
    if !completedNodes.contains(startNode) {
      completedNodes.insert(startNode)
      order.append(startNode)
    }
    
  }
  
  for node in startingNodes {
    try dfs(startNode: node)
  }
  
  if order.isEmpty {
    throw MyError.NotPossible
  }
  
  return order
}


do {
//  try buildOrder(dependencyMap: dependencyMap)
  try buildOrder(dependencyMap: ["a":["b"], "b":["a"]])
} catch {
  print("Exception")
}

