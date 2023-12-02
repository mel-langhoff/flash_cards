require "./lib/card_generator.rb"

RSpec.describe CardGenerator do
    it "exists" do
        filename = "cards.txt"
        cards = CardGenerator.new(filename)

        expect(cards).to be_an_instance_of(CardGenerator)
    end

    it "has cards" do
        filename = "cards.txt"
        cards = CardGenerator.new(filename).cards

        expect(cards).to be_a Array
        expect(cards).not_to be_empty
        expect(cards.first).to be_an_instance_of(Card)
        expect(cards.first.question).to eq("What is the capital of Alaska?")
        expect(cards.first.answer).to eq("Juneau")
        expect(cards.first.category).to eq("Geography")
        expect(cards.last).to be_an_instance_of(Card)
        expect(cards.last.question).to eq("What is 5 + 5?")
        expect(cards.last.answer).to eq("10")
        expect(cards.last.category).to eq("Math")
    end
end