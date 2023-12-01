class Round
    attr_reader :deck, :turns, :number_correct, :category, :card_count

    def initialize(deck)
        @deck = deck
        @turns = []
        @category = []
        @card_count = 0
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        @current_card = @deck.cards.first
        @turns << Turn.new(guess, @current_card)
        @deck.cards.rotate!
        @turns.last
    end

    def correct?
        @turns.first.guess == @turns.first.card.answer
    end

    def number_correct
        number_correct = @turns.count do |turn|
            turn.correct?
        end
    end

    def number_correct_by_category(category)
        number_correct_by_category = @turns.select do |turn|
            turn.feedback == "Correct!" && turn.card.category == category
        end
        number_correct_by_category.count
    end

    def percent_correct
        (number_correct.to_f / @turns.count.to_f) * 100
    end

    def percent_correct_by_category(category)
        ((number_correct_by_category(category)) / deck.cards_in_category(category).count) * 100
    end

    def start
        puts "Welcome! You're playing with #{deck.cards.count} cards."
        puts "-------------------------------------------------"
        until turns.count == deck.cards.count
            play_card
        end
        puts "***** Game over! ******"
        puts "You had #{number_correct} correct guesses out of #{turns.count} for a total score of #{percent_correct}%."
    end

    def play_card
        current_card_number = @card_count + 1
        @current_card = deck.cards.first
        puts "This is card number #{current_card_number} out of #{deck.cards.count}."
        puts "Question: #{@current_card.question}"
        guess = gets.chomp
        take_turn(guess)
        puts @turns.last.feedback
    end
end