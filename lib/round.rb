class Round
    attr_reader :deck, :turns, :number_correct, :category

    def initialize(deck)
        @deck = deck
        @turns = []
        @category = []
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
        @number_correct = @turns.count do |turn|
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
        (@number_correct.to_f / @turns.count.to_f) * 100
    end

    def percent_correct_by_category(category)
        ((number_correct_by_category(category)) / deck.cards_in_category(category).count) * 100
    end

end