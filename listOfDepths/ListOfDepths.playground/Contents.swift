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

func generateList(root: Node) -> [Int: [Node]]
{
  var map = [Int: [Node]]()
  var q = [Node]()
  
  q.append(root)
  root.depth = 0
  
  while !q.isEmpty {
    let node = q.removeFirst()
    if map[node.depth] == nil {
      map[node.depth] = [node]
    } else {
      map[node.depth]?.append(node)
    }
    
    if let left = node.left {
      left.depth = node.depth + 1
      q.append(left)
    }
    
    if let right = node.right {
      right.depth = node.depth + 1
      q.append(right)
    }
  }
  
  return map
}

print(generateList(root: node1))
