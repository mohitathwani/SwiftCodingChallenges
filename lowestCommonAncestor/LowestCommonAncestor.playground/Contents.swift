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

func lowestCommonAncestor(root: Node?, node1: Node, node2: Node) -> Node?{
  
  func find(root: Node?) -> Node? {
    guard let root = root else {
      return nil
    }
    
    if root.value == node1.value || root.value == node2.value {
      return root
    }
    
    let left = find(root: root.left)
    let right = find(root: root.right)
    
    if left != nil && right != nil {
      return root
    }
    
    return (left == nil) ? right : left
  }
  return find(root: root)
}

lowestCommonAncestor(root: node1, node1: node4, node2: node1)
