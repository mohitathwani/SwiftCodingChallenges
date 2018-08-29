//866


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

func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
  guard let result = findDeepest(root: root, curDepth: 0) else {
    return nil
  }
  
  return result.node
}

func findDeepest(root: TreeNode?, curDepth: Int) -> (depth: Int, node: TreeNode?)?{
  guard let root = root else {
    return nil
  }
  
  print(root.val, curDepth)
  let leftResult = findDeepest(root: root.left, curDepth: curDepth + 1)
  
  let rightResult = findDeepest(root: root.right, curDepth: curDepth + 1)
  
  if leftResult == nil && rightResult == nil {
    return (curDepth, root)
  }
  
  if leftResult != nil && rightResult == nil {
    return leftResult
  }
  
  if rightResult != nil && leftResult == nil {
    return rightResult
  }
  
  if leftResult?.depth == rightResult?.depth {
    return (leftResult!.depth, root)
  }
  
  if leftResult!.depth > rightResult!.depth {
    return leftResult!
  }
  
  return rightResult!
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

subtreeWithAllDeepest(root)?.val
