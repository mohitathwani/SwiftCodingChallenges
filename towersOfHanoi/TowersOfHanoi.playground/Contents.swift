func towersOfHanoi(n: Int) -> [Int] {
  var left = [Int]((1...n).reversed())
  var center = [Int]()
  var right = [Int]()
  
  print(left, center, right)
  func solve(from a: inout [Int], to c: inout [Int], using b: inout [Int], count: Int) {
    if count > 0 {
      solve(from: &a, to: &b, using: &c, count: count - 1)
      if !a.isEmpty {
        c.append(a.removeLast())
        print(left, center, right)
      }
      solve(from: &b, to: &c, using: &a, count: count - 1)
    }
  }
  
  solve(from: &left, to: &right, using: &center, count: n)
  
  return right
}

print(towersOfHanoi(n: 2))

//
//2
//3 1
//_ _ _
