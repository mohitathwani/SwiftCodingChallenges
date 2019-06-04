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

func checkBalanced(root: Node) -> Bool {
  var balanced = false
  
  func getHeight(node: Node?) -> Int {
    guard let node = node else {
      return -1
    }
    
    let leftHeight = getHeight(node: node.left)
    guard leftHeight != Int.min else {return Int.min}
    
    let rightHeight = getHeight(node: node.right)
    guard rightHeight != Int.min else {
      return Int.min
    }
    
    if abs(leftHeight - rightHeight) <= 1 {
      return max(leftHeight, rightHeight) + 1
    }
    
    return Int.min
  }
  
  return getHeight(node: root) != Int.min
}


print(checkBalanced(root: node1))
