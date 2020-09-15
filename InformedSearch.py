# -*- coding: utf-8 -*-
"""
Created on Thu Feb 13 14:39:42 2020

@author: User
"""
import math



def main():
    
    grid = readGrid('InformedSearchGrid.txt')
    
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
    
    
    #print(Heuristic(start,goal))
    #print(grid[0][0])
    print('Enter True for Greedy Search or False for A*')
    searchType = (input())
    
    if searchType == 'True':
        search = True
    if searchType == 'False':
        search = False
    
    
    
    path = (uninformedSearch(grid, start, goal, search))
    
    (outputGrid(grid, start, goal, path))
    


def uninformedSearch(useGrid, start, goal, greedySearch):
    open_List = []
    closed_List = []
    current = Node(start, None, useGrid[start[0]][start[1]], Heuristic(start,goal),greedySearch)
    path_List = []
    statesExpanded = 0
    expanded = 'Number of States Expanded: {}'
    
    
    
    
    open_List.append(current)
    success = False
    
    
    
    while open_List != [] or success == False:
        if open_List == []:
            break
            
        use = open_List.pop(0)
        a = use.nodeValue
        
        current = Node(a,use.nodeParent,use.g,use.h,use.greedy)
            
        
        if current.nodeValue == goal:
            success = True
        
        closed_List.append(current)
        
            
        statesExpanded+=1
        
        expandNode(current, useGrid, closed_List, open_List,goal)
        
        
            
        if current.nodeValue == goal:
            break
        
       
    if current.nodeValue == goal:
        print(expanded.format(statesExpanded))
        print('Heuristic Used: Euclidean Distance')
        print('Solution found')
        path = setPath(current,path_List)
        print(path_List)
        print('Path shown in path.txt')
        
        return path
    
    
            
        
    else:
        print(expanded.format(statesExpanded))
        print('Heuristic Used: Euclidean Distance')
        print('Solution not found')    
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
    def __init__(self,value, parent, path, hueristic, greedy):
        self.nodeValue = value
        self.nodeParent = parent
        self.g = path
        self.h = hueristic
        self.f = path + hueristic
        self.greedy = greedy
        

    def __lt__(self, other):
        if self.greedy == True:
            if self.h < other.h:
                return True
            else:
                return False
        else:
            if self.f < other.f:
                return True
            else:
                return False
            
            
def Heuristic(location1,location2):
    a = math.pow((location1[0] - location2[0]),2)
    b = math.pow((location1[1] - location2[1]),2)
    
    c = a+b
    
    return math.sqrt(c)            



def getNeighbors(location, grid):

    finalList = []	
    
            
    if location[0] -1 >=0:
          if(grid[(location[0]- 1)][location[1]] >= 1):    
              finalList.append([location[0] - 1, location[1]])
    
    if location[0] + 1  < len(grid):
      if(grid[(location[0] + 1)][location[1]] >= 1):  
        finalList.append([location[0] + 1, location[1]])
        
  
    if location[1]-1 >= 0:
        if(grid[location[0]][(location[1] - 1)] >= 1):    
            finalList.append([location[0], location[1] - 1])       
   
    
    if location[1]+1 < len(grid[0]):
        if(grid[location[0]][(location[1] + 1)] >= 1):
            finalList.append([location[0], location[1] + 1])
            
    
    return finalList
  
 
def expandNode(node1, grid, close_list, open_list, goal):
    
    
    neighborList = getNeighbors(node1.nodeValue, grid)
    
    if node1.greedy == True:
            
        for i in neighborList:
        
            l = i[0]
            s = i[1]
            iPath = grid[l][s] + node1.g
            iHeuristic = Heuristic(i,goal)
            newNode = Node(i, node1, iPath,iHeuristic,node1.greedy)
        
            if not compareValue(newNode, open_list) and not compareValue(newNode, close_list):
                open_list.append(newNode)
        
    if node1.greedy == False:
        
        for i in neighborList:
        
            l = i[0]
            s = i[1]
            iPath = grid[l][s] + node1.g
            iHeuristic = Heuristic(i,goal)
            newNode = Node(i, node1, iPath,iHeuristic,node1.greedy)
            
            
            for a in open_list:
                 
                if newNode.nodeValue == a.nodeValue:
                    newG = newNode.g
                    oldG = a.g
                    if newG < oldG:
                        open_list.remove(a)
                        open_list.append(newNode)
                        for d in close_list:
                            if a.nodeValue == d.nodeValue:
                                close_list.remove(d)
            if not compareValue(newNode, close_list):
                open_list.append(newNode)
                        
    

def compareValue(node1, aList):
     
    for a in aList:
        if node1.nodeValue == a.nodeValue:
            return True
    return False
    
                        
main()