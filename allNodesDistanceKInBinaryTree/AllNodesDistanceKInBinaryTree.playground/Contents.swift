//https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/solution/
//We are given a binary tree (with root node root), a target node, and an integer value `K`.
//
//Return a list of the values of all nodes that have a distance K from the target node.  The answer can be returned in any order.
//
//
//
//Example 1:
//
//Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, K = 2
//Output: [7,4,1]
//Explanation:
//The nodes that are a distance 2 from the target node (with value 5)
//have values 7, 4, and 1.
//
//Note that the inputs "root" and "target" are actually TreeNodes.
//The descriptions of the inputs above are just serializations of these objects.
//
//Note:
//
//The given tree is non-empty.
//Each node in the tree has unique values 0 <= node.val <= 500.
//The target node is a node in the tree.
//0 <= K <= 1000.

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

extension TreeNode: Hashable, CustomStringConvertible {
  public var description: String {
    return "\(val)"
  }
  
  public var hashValue: Int {
    return val
  }
  
  public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
    return lhs.val == rhs.val
  }
}

func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
  guard let root = root, let target = target else {
    return [Int]()
  }
  
  var parentMap = [TreeNode:TreeNode?]()
  var result = [Int]()
  
  func dfs(currentNode: TreeNode?, parentNode: TreeNode?) {
    guard let currentNode = currentNode else {
      return
    }
    
    parentMap[currentNode] = parentNode
    dfs(currentNode: currentNode.left, parentNode: currentNode)
    dfs(currentNode: currentNode.right, parentNode: currentNode)
  }
  
  dfs(currentNode: root, parentNode: nil)
  
  func bfs(startNode: TreeNode) {
    var q = [TreeNode]()
    var seenSet = [TreeNode]()
    
    q.append(startNode)
    seenSet.append(startNode)
    
    var distanceMap = [TreeNode:Int]()
    distanceMap[startNode] = 0
    
    if K == 0 {
      result.append(startNode.val)
      return
    }
    
    while !q.isEmpty {
      let node = q.removeFirst()
      if let left = node.left, !seenSet.contains(left) {
        q.append(left)
        seenSet.append(left)
        
        distanceMap[left] = distanceMap[node]! + 1
        if distanceMap[left]! == K {
          result.append(left.val)
        }
      }
      
      if let right = node.right, !seenSet.contains(right) {
        q.append(right)
        seenSet.append(right)
        
        distanceMap[right] = distanceMap[node]! + 1
        if distanceMap[right]! == K {
          result.append(right.val)
        }
      }
      
      if let optionalParent = parentMap[node], let parent = optionalParent, !seenSet.contains(parent) {
        q.append(parent)
        seenSet.append(parent)
        
        distanceMap[parent] = distanceMap[node]! + 1
        if distanceMap[parent]! == K {
          result.append(parent.val)
        }
      }
    }
  }
  
  bfs(startNode: target)
  return result
}

let root = TreeNode(3)
let fiveNode = TreeNode(5)
let oneNode = TreeNode(1)
let sixNode = TreeNode(6)
let twoNode = TreeNode(2)
let zeroNode = TreeNode(0)
let eightNode = TreeNode(8)
let sevenNode = TreeNode(7)
let fourNode = TreeNode(4)

root.left = fiveNode
root.right = oneNode

fiveNode.left = sixNode
fiveNode.right = twoNode

oneNode.left = zeroNode
oneNode.right = eightNode

twoNode.left = sevenNode
twoNode.right = fourNode

distanceK(root, root, 0)
