class CardGenerator
    attr_reader :cards_array

    def initialize(filename)
        @filename = filename
        @cards_array = []
    end

    def cards
        File.readlines(@filename, chomp: true).each do |line|
            question, answer, category = line.split(",")
            card = Card.new(question, answer, category)
            @cards_array << card
        end
        @cards_array
    end
end