
import random
import math

class Board():

    def __init__(self, numRowsCols):
        self.cells = [[0] * numRowsCols for i in range(numRowsCols)]
        self.numRows = numRowsCols
        self.numCols = numRowsCols

		# negative value for initial h...easy to check if it's been set or not
        self.h = -1

    # Print board
    def printBoard(self):
        for row in self.cells:
            print (row)

    # Randomize the board
    def rand(self):
        for row in self.cells:
            i = random.randint(0, self.numCols-1)
            row[i] = 1

    # Swap two locations on the board
    def swapLocs(self, a, b):
        temp = self.cells[a[0]][a[1]]
        self.cells[a[0]][a[1]] = self.cells[b[0]][b[1]]
        self.cells[b[0]][b[1]] = temp





# Cost function for a board
def numAttackingQueens(board):

    # Collect locations of all queens
    locs = []
    for r in range( len(board.cells) ):
        for c in range( len(board.cells[r]) ):
            if board.cells[r][c] == 1:
                locs.append([r, c])
    #print 'Queen locations: %s' % locs

    result = 0

    # For each queen (use the location for ease)
    for q in locs:

        # Get the list of the other queen locations
        others = [x for x in locs if x != q]
        #print 'q: %s others: %s' % (q, others)
    
        count = 0
        # For each other queen
        for o in others:
            #print 'o: %s' % o
            diff = [o[0] - q[0], o[1] - q[1]]

            # Check if queens are attacking
            if o[0] == q[0] or o[1] == q[1] or abs(diff[0]) == abs(diff[1]):
                count = count + 1

        # Add the amount for this queen
        result = result + count

    return result




# Move any queen to another square in the same column
# successors all the same                                                                                                                
def getSuccessorStates(board):
    result = []

    for i_row, row in enumerate(board.cells):
        # Get the column the queen is on in this row
        # [0] because list comprehension returns a list, even if only one element
        # This line will crash if the board has not been initialized with rand() or some other method
        i_queen = [i for i,x in enumerate(row) if x == 1][0]

        # For each column in the row
        for i_col in range(board.numCols):

            # If the queen is not there
            if row[i_col] != 1:
                # Make a copy of the board
                bTemp = Board(board.numRows)
                bTemp.cells[:] = [r[:] for r in board.cells]

                # Now swap queen to i_col from i_queen
                bTemp.swapLocs([i_row, i_col], [i_row, i_queen])
                #bTemp.printBoard()
                result.append(bTemp)

    return result


def scheduling(T,decay):
    newT = T * decay
    return newT


#initBoard    - Initial board for algoirhtm
#decayRate    - How quickly the temperature val of T should decrease
#T_Threshold  - Value of T when the algorithm should terminate
def simulatedAnnealing(initBoard, decayRate, T_Threshold):
    T = 100 #Set initial T value
    current = initBoard #Create current variable & initialize to initBoard
    current.h = numAttackingQueens(current) #Set heuristic cost for the current board
    averageH = 0
    count = 0
    
    #Search Loop
    
    #Termination Condition (should be inside the loop)
    while current.h != 0 or T >= T_Threshold:
        averageH = averageH + current.h
        count+=1
        T = scheduling(T,decayRate)
        if T <= 0:
            break
        listOfSuccessorStates = getSuccessorStates(current)  
        index = random.randrange(0, len(listOfSuccessorStates)-1)
        nextState = listOfSuccessorStates[index]
        nextState.h = numAttackingQueens(nextState)
        #selecting the next node
        if current.h - nextState.h > 0:
            current = nextState
    
        elif math.exp((current.h-nextState.h)/T) >= T_Threshold:
            current = nextState
            
        else:
            current = current
                
    
    txt = 'Average H Value: {}'
    aH = averageH / count
    print(txt.format(round(aH)))        
    return current   

def main():
    boardsize = 4
    decayRate = .9
    T = .00000001
    a = 0
    
    summary = 'Board Size: {}, Decay Rate: {}, Threshold: {}'
    print(summary.format(boardsize,decayRate,T))
    
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')
        
    
    decayRate = .75
    a = 0
    print(summary.format(boardsize,decayRate,T))
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')
        
    decayRate = .5
    a = 0  
    print(summary.format(boardsize,decayRate,T))      
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')
        
        
    boardsize = 8
    decayRate = .9
    T = .00000001
    a = 0
    print(summary.format(boardsize,decayRate,T))
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')
        
        
    decayRate = .75
    a = 0
    print(summary.format(boardsize,decayRate,T))
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')
        
        
    decayRate = .5
    a = 0
    print(summary.format(boardsize,decayRate,T))
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')        
    
    
    boardsize = 16
    decayRate = .9
    print(summary.format(boardsize,decayRate,T))
    a = 0
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')
        
    decayRate = .75
    a=0
    print(summary.format(boardsize,decayRate,T))
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')        
        
        
    decayRate = .5
    a=0
    print(summary.format(boardsize,decayRate,T))
    while(a<10):
        b = Board(boardsize)
        b.rand()
        txt = 'Run: {}'
        print(txt.format(a))
        a+=1
        
        print('Initial Board: ')
        b.printBoard()
    
        finalBoard = simulatedAnnealing(b,decayRate,T)
        print('Final Board:' )
        
    
        finalBoard.printBoard()
        print(' ')        

main()    
     