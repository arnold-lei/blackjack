require 'pry'


#This is my second attempt at BlackJack after watching some of the solutions video. I think it might just be easier to restart
#then to salvage my code as is. 
#Methods!
def calculating_totals(cards)
	#isolate the rankings of the cards from the suits
	value = cards.map {|e| e[1] }

	total = 0 
	value.each do |card|
		if card == "A"
			total += 11
		elsif card.to_i == 0
			total += 10
		else
			total += card.to_i
		end
	end

	value.select{|card| card == 'A'}.count.times do 
		total -= 10 if total > 21
	end
	total 
end

#Deal
def deal(deck, hand)
	hand << deck.pop
end

#Welcome to Black Jack
puts "Welcome to Black Jack"
puts "Welcome to my table, what's your name?"
player_name = gets.chomp
puts "Hi #{player_name} good luck!"

#Creating the Deck
ranking = %w(1 2 3 4 5 6 7 8 9 10)
suits = %w(♦ ♣ ♥ ♠)
deck = suits.product(ranking)
deck.shuffle!

#Dealing Cards
player_hand = []
dealer_hand = []


player_hand << deck.pop
dealer_hand << deck.pop
player_hand << deck.pop
dealer_hand << deck.pop

dealer_total = calculating_totals(dealer_hand)
player_total = calculating_totals(player_hand)

puts "Dealer has: #{dealer_hand[0]} and #{dealer_hand[1]}, for a total of #{dealer_total}"
puts "You have: #{player_hand[0]} and #{player_hand[1]}, for a total of: #{player_total}"

#Player's Hit stay phase

if player_total == 21
	puts "Congratulation you won!"
	exit 
end 

while player_total < 21 do 
	puts "What would you like to do? Type 'H' to Hit, type 'S' to Stay"
	choice = gets.chomp.to_s.upcase!
	if choice == 'H'
		deal(deck, player_hand)
	elsif choice == 'S'
		puts "You choose to stay."
		break
	else
		puts "Please choose 'H' or 'S'"
	end
	player_total = calculating_totals(player_hand)
	#not sure why I have to recalculate this again. 
	puts "You have #{player_hand} for a total of #{player_total}"
end

if player_total > 21 
	puts "Sorry, you busted"
	exit 
elsif player_total == 21
	puts "Congratulation you won!"
	exit 
end

#Dealer's Turn

while dealer_total < 16
	dealer_total = calculating_totals(dealer_hand)
	deal(deck, dealer_hand)
end

if dealer_total > 21
	puts "Congratualtions Dealer busted, you win!"
elsif dealer_total > player_total
	puts "Dealer has #{dealer_total}, you have #{player_total} sorry you lose"
elsif player_total > dealer_total
	puts "Dealer has #{dealer_total}, you have #{player_total} Congratualtions you win"
end
