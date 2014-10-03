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
def full_deck
	ranks = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
	suits = ['♦', '♣', '♥', '♠']
	deck = suits.product(ranks)

end

#Player & Dealer hands
player_hand = []
dealer_hand = []
choice = []

#Counter used to keep track of which cards are still in play
card_counter = [*1..52]

#dealing cards to player
def deal(deck, player_hand, card_counter)
	#draw a random card from the deck
	pick = card_counter.sample
	random_card = deck[pick]
	player_hand << random_card
	puts "You have recieved a #{random_card[1]}#{random_card[0]}"
	deck.delete_at(pick)
	card_counter.delete_at(pick)
end

#Dealing Cards to dealer
def deal_dealer(deck, dealer_hand, card_counter)
	#draw a random card from the deck
	pick = card_counter.sample
	random_card = deck[pick]
	dealer_hand << random_card
	puts "The dealer recieved a #{random_card[1]}#{random_card[0]}"
	deck.delete_at(pick)
	card_counter.delete_at(pick)
end

#Adding Points Condition
def adding_points(hand)
	choice = 3
	points = []
	value = hand.collect{|value| value[1]}
	value.each do |points|
		if points == 'K' || points == 'Q' || points == 'J'
			points = 10
		elsif points == 'A'
			loop do 
			puts "What value do you want your Ace to be? 1 or 10"
			choice = gets.chomp.to_i
				if choice == 1
					points = 1
				elsif choice == 10
					points = 10
				else
					puts "please choose 1 or 10"
				end
			end until choice == 1 || choice == 10
		else 
		end	
	points = value.inject{|sum, card| sum + card}
	p points
end
end

deck = full_deck

puts "Welcome to my table, what's your name?"
player_name = gets.chomp
puts "Hi #{player_name} good luck!"

#Deal Player's first card
deal(deck, player_hand, card_counter)

#Deal Computer's First Card
deal_dealer(deck, dealer_hand, card_counter)

#Deal Player's Second Card
deal(deck, player_hand, card_counter)

#Deal Computer's Second Card
deal_dealer(deck, dealer_hand, card_counter)
puts "Dealer has #{dealer_hand}" 

#Dealer's total score
adding_points(dealer_hand)

#Player's hand
puts "#{player_name} have #{player_hand}" 

#Player's score
adding_points(player_hand)

loop do
	puts "Would you like to hit(h) or stay(s)"
	choice = gets.chomp
	if choice == 'h'
		deal(deck, player_hand, card_counter)
		puts "#{player_name} you currently have #{player_hand}"
		adding_points(player_hand)
	else
	end
end until choice == 'h'
	


