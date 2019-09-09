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

func matchTrees(t1: Node?, t2: Node?) -> Bool {
  if t1 == nil && t2 == nil {
    return true
  }
  
  if t1 == nil || t2 == nil {
    return false
  }
  
  if t1?.value != t2?.value {
    return false
  }
  
  return matchTrees(t1: t1?.left, t2: t2?.left) && matchTrees(t1: t1?.right, t2: t2?.right)
}

func findRoot(t1: Node?, t2: Node?) -> Bool {
  if t1 == nil {
    return false
  }
  
  if t1?.value == t2?.value {
    return matchTrees(t1: t1, t2: t2)
  }
  
  return findRoot(t1: t1?.left, t2: t2) || findRoot(t1: t1?.right, t2: t2)
}

func checkSubTree(t1: Node?, t2: Node?) -> Bool {
  if t2 == nil {
    return true
  }
  
  return findRoot(t1: t1, t2: t2)
}
