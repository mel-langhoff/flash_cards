require "./lib/turn"
require "./lib/deck"
require "./lib/card"
require "./lib/round"

RSpec.describe Round do
    it "exists" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round).to be_a Round
    end

    it "#turns" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it "#current_card" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
    end

    it "#take turn" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        
        # expect(new_turn).to be_a(Turn)
        expect(round.turns).to eq([new_turn])
        expect(round.current_card).to eq(card_2)
    end

    it "is a Turn" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.class).to eq (Turn)
    end

    it "#correct?" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.correct?).to eq(true)
    end

    it "#number_correct" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)
        expect(new_turn.correct?).to be true

        new_turn = round.take_turn("Venus")

        expect(round.number_correct).to eq(1)
        expect(round.turns.last.feedback).to eq("Incorrect.")
    end

    it "#number_correct_by_category" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        new_turn = round.take_turn("Venus")

        expect(round.number_correct_by_category(:Geography)).to eq(1)
        expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it "#percent_correct" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)
        expect(round.turns.count).to eq(1)
        expect(round.percent_correct).to eq(100)

        new_turn = round.take_turn("Venus")

        expect(round.number_correct).to eq(1)
        expect(round.turns.count).to eq(2)
        expect(round.percent_correct).to eq(50)
    
        expect(round.percent_correct_by_category(:Geography)).to eq(100)
        expect(round.current_card).to eq(card_3)
    end

    it "#percent_correct_by_category" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        
        round.take_turn("Venus")

        expect(round.percent_correct_by_category(:Geography)).to eq(100)
        expect(round.current_card).to eq(card_3)
    end
end