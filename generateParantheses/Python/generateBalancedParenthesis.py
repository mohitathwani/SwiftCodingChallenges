# Converted to Python by Tyson Kamp (https://github.com/tysonkamp).  Remaining comments from original author.
#
# https:#leetcode.com/problems/generate-parentheses/description/
# Given n pairs of parentheses, write a deftion to generate all combinations of well-formed parentheses.
#
# For example, given n = 3, a solution set is:
#
# [
# "((()))",
# "(()())",
# "(())()",
# "()(())",
# "()()()"
# ]

#/usr/bin/python

def generateParenthesis(n):
	"Bootstrap the recursive process that will generate permutations of string with "n" balanced parenthesis"
	result = []
	s = ""

	backtrack(n, s, result)
	return result

def backtrack(n, s, result, numOpen = 0, numClose = 0):
	"Add comment"
	if len(s) == 2 * n :
	  result.append(s)
	  return

	if numOpen < n :
	  s += "("
	  backtrack(n, s, result, numOpen + 1, numClose)
	  s = s[:-1]

	if numClose < numOpen :
	  s += ")"
	  backtrack(n, s, result, numOpen, numClose + 1)
	  s = s[:-1]
  
n = input("How many sets of balanced parenthesis permutations would you like? Enter an integer >= 0 : ")

if n.isdigit() and int(n) >= 0 :
	combinationsList = generateParenthesis(int(n))
	for answer in combinationsList: print( answer )
	sys.exit(0)
else:
	print("Need a natural number as input.")
	sys.exit(-1)
