require 'pry'

#There are 52 Cards in a deck 
#13 cards of each suit
#cards go 1-10,J,Q,K,A
# ♦, ♥, ♣, ♠
#J,Q,K are worth 10 points each
#A are worth 11 or 1 point

#card = [{A =>[1,11]}], [{2 => [2]}], 3 =>[3]....}

#Welcome to the game,
#Ask player to enter their name
#pass out the Cards. The order should go Player, Dealer, Player, Dealer
#	2 cards to the player 
#	2 cards to the dealer

#Loop
#	Dealer asks Player if he would like to Hit/Stay?
#	Player chooses to Hit or stay
#		if Hit player will then recieve another cards
#end until player says Stay

#Dealer receives Cards
#	if he has >= 16 
#	Dealer stays 

#Compare card totals 
#Highest score wins
#Tie if values are the same 
#Ask player to play again

#Building the deck
card_counter = [*1..52]
pick = card_counter.sample
p card_counter
p pick
