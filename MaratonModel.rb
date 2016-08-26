require 'csv'

class Card
attr_reader :category, :question, :answer
  def initialize(category, question, answer)
    @category = category
    @question = question
    @answer = answer
    to_csv
  end

  def to_csv
    CSV.open("PreguntasKarla.csv", "a+") do |csv|
        csv << [@category, @question]
        csv << [@category, @answer]
    end
  end
end

class Deck
attr_reader :cards

  def initialize(category)
    @category = category
    @cards = read_csv
  end

  def play
    p @cards
  end

  def read_csv
    arr = []
    CSV.foreach("PreguntasKarla.csv") do |row|
      next unless row[0] == @category
      arr << row[1..-1]
    end
    arr.each_slice(2).to_a
  end
end


