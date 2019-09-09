//       1
//    /     \
//   2       3
// /   \   /   \
//4     5

class Node: CustomStringConvertible {
  var description: String {
    return "\(value)"
  }
  
  var value = 0
  var depth = -1
  var left: Node? = nil
  var right: Node? =  nil
  
  init(value: Int) {
    self.value = value
  }
}

let node5 = Node(value: 5)
let node4 = Node(value: 4)
let node3 = Node(value: 3)
let node2 = Node(value: 2)
node2.left = node4
node2.right = node5
let node1 = Node(value: 1)
node1.left = node2
node1.right = node3

node5.left = Node(value: 6)

func weave(left: inout [Int], right: inout [Int], temp: inout [Int], results: inout [[Int]]) {
  if left.isEmpty || right.isEmpty {
    var result = temp
    result.append(contentsOf: left)
    result.append(contentsOf: right)
    results.append(result)
    return
  }
  
  let leftFirst = left.removeFirst()
  temp.append(leftFirst)
  weave(left: &left, right: &right, temp: &temp, results: &results)
  temp.removeLast()
  left.insert(leftFirst, at: 0)
  
  let rightFirst = right.removeFirst()
  temp.append(rightFirst)
  weave(left: &left, right: &right, temp: &temp, results: &results)
  temp.removeLast()
  right.insert(rightFirst, at: 0)
}

func bstSequences(root: Node?) -> [[Int]] {
  var allResults = [[Int]]()
  guard let root = root else {
    allResults.append([Int]())
    return allResults
  }
  
  let leftLists = bstSequences(root: root.left)
  let rightLists = bstSequences(root: root.right)
  
  var prefix = [root.value]
  
  if leftLists.isEmpty && rightLists.isEmpty {
    return [prefix]
  }
  
  for var leftList in leftLists {
    for var rightList in rightLists {
      var weavedList = [[Int]]()
      weave(left: &leftList, right: &rightList, temp: &prefix, results: &weavedList)
      allResults.append(contentsOf: weavedList)
    }
  }
  
  return allResults
}

bstSequences(root: node1)
