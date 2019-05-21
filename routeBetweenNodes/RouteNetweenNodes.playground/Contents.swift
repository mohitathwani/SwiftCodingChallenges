var map = [Int:[Int]]()
map[1] = [3]
map[2] = [4, 5]
map[3] = [6]
map[4] = []
map[5] = [1]
map[6] = [2]

var visited = [Bool](repeating: false, count: 6)

func routeBetween(a: Int, b: Int) -> Bool {
  var routeExists = false
  
  var q = [Int]()
  q.append(a)
  
  while !q.isEmpty {
    let first = q.removeFirst()
    if first == b {
      routeExists = true
      break
    }
    
    visited[first - 1] = true
    
    for neighbor in map[first]! {
      if visited[neighbor - 1] == false {
        q.append(neighbor)
      }
    }
  }
  return routeExists
}

//routeBetween(a: 1, b: 2)
routeBetween(a: 1, b: 4)
