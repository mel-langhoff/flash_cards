require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
    it "exists" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    it "has a card" do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)

        expect(turn1.card).to eq(card1)
    end

    it "has a guess" do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)

        expect(turn1.guess).to eq("Juneau")
    end

    it "#correct?" do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)
        card2 = card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn2 = Turn.new("Saturn", card2)

        expect(turn1.correct?).to be true
        expect(turn2.correct?).to be false
    end

    it "#feedback" do
        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn1 = Turn.new("Juneau", card1)
        card2 = card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn2 = Turn.new("Saturn", card2)

        expect(turn1.feedback).to eq("Correct!")
        expect(turn2.feedback).to eq("Incorrect.")
    end
end