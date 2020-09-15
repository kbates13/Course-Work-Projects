# -*- coding: utf-8 -*-
"""
Created on Wed Feb 12 22:28:47 2020

@author: User
"""

def main():
    
    grid = readGrid('SearchGrid.txt')
    
    print('Enter  x value for start location')
    start1 = input()
    print('Enter  y value for start location')
    start2 = input()
    
    start = [int(start1),int(start2)]
    
    
    print('Enter x value for goal location')
    goal1 = input()
    print('Enter y value for goal location')
    goal2 = input()
    
    goal = [int(goal1),int(goal2)]
    
    
    
    print('Enter DFS or BFS')
    searchType = input()
    
    path = (uninformedSearch(grid, start, goal, searchType))
    
    (outputGrid(grid, start, goal, path))
    
    print('Path shown in path.txt')
    


def uninformedSearch(useGrid, start, goal, search):
    open_List = []
    closed_List = []
    current = Node(start, None)
    path_List = []
    
    
    
    open_List.append(current)
    success = False
    
    
    while open_List != [] or success == False:
        if open_List == []:
            break
        
        if search == 'BFS':
            
            use = open_List.pop(0)
        
            current = Node(use.nodeValue,use.nodeParent)
        
            if current.nodeValue == goal:
                success = True
        
            closed_List.append(current)
        
            expandNode(current, useGrid, closed_List, open_List)
            
        else:
            use = open_List.pop()
        
            current = Node(use.nodeValue,use.nodeParent)
        
            if current.nodeValue == goal:
                success = True
        
            closed_List.append(current)
        
            expandNode(current, useGrid, closed_List, open_List)
        
       
        if current.nodeValue == goal:
            return setPath(current,path_List)
            break
        
    #else:
    return []
            
        
def setPath(current, path):
    
    while current.nodeParent != None:
        path.append(current.nodeValue)
        current = current.nodeParent
    path.append(current.nodeValue)     

        
    return path    
    
    
    
    
    

def readGrid(filename):
    #print('In readGrid')
    grid = []
    with open(filename) as f:
        for l in f.readlines():
            grid.append([int(x) for x in l.split()])
   
    f.close()
    #print 'Exiting readGrid'
    return grid

# Writes a 2D list of 1s and 0s with spaces in between each character
# 1 1 1 1 1
# 1 0 0 0 1
# 1 0 0 0 1
# 1 1 1 1 1
def outputGrid(grid, start, goal, path):
    #print('In outputGrid')
    filenameStr = 'path.txt'
 
    # Open filename
    f = open(filenameStr, 'w')
 
    # Mark the start and goal points
    grid[start[0]][start[1]] = 'S'
    grid[goal[0]][goal[1]] = 'G'
 
    # Mark intermediate points with *
    for i, p in enumerate(path):
        if i > 0 and i < len(path)-1:
            grid[p[0]][p[1]] = '*'
 
    # Write the grid to a file
    for r, row in enumerate(grid):
        for c, col in enumerate(row):
           
            # Don't add a ' ' at the end of a line
            if c < len(row)-1:
                f.write(str(col)+' ')
            else:
                f.write(str(col))
 
        # Don't add a '\n' after the last line
        if r < len(grid)-1:
            f.write("\n")
 
    # Close file
    f.close()
    #print('Exiting outputGrid')



class Node:
    def __init__(self,value, parent):
        self.nodeValue = value
        self.nodeParent = parent



def getNeighbors(location, grid):

    finalList = []

		
    
            
    if location[0] -1 >=0:
          if(grid[(location[0]- 1)][location[1]] == 0):
              finalList.append([location[0] - 1, location[1]])
    
    if location[0] + 1  < len(grid):
      if(grid[(location[0] + 1)][location[1]] == 0):
        finalList.append([location[0] + 1, location[1]])
        
  
    if location[1]-1 >= 0:
        if(grid[location[0]][(location[1] - 1)] == 0):
            finalList.append([location[0], location[1] - 1])       
   
    
    if location[1]+1 <= len(grid[0]):
        if(grid[location[0]][(location[1] + 1)] == 0):
            finalList.append([location[0], location[1] + 1])
            
    
    return finalList
  
 
def expandNode(node1, grid, close_list, open_list):
    
    #print('Beginning Expand Node')
    a = node1.nodeValue
    neighborList = getNeighbors(a, grid)
    
    
    for i in neighborList:
        newNode = Node(i, node1)
        if not compareValue(newNode, close_list) and not compareValue(newNode, open_list):
            open_list.append(newNode)
    #print('Ending Expand Node')        
      	
    

def compareValue(node1, aList):
    for i in aList:
        if node1.nodeValue == i.nodeValue:
            return True
    return False    
            
main()