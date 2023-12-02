class CardGenerator
    attr_reader :cards_array

    def initialize(filename)
        @filename = filename
        @cards_array = cards
    end

    def cards
        text_file_cards = []
        File.readlines(@filename, chomp: true).each do |line|
            question, answer, category = line.split(",")
            card = Card.new(question, answer, category)
            text_file_cards << card
        end
        text_file_cards
    end
end