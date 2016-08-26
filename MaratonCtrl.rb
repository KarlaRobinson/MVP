require_relative "MaratonModel.rb"
require_relative "MaratonView.rb"

class Controler

  def initialize(arr_of_strings)
    method = arr_of_strings[0]
    @category = arr_of_strings[1]
    @answer = arr_of_strings[2]
    @question = arr_of_strings[3]
    #@guess = arr_of_strings[1..-1].join(" ")
    @view = View.new
    card if method == "card"
    deck if method == "deck"
    game if method == "game"
  end

  def card
    card = Card.new(@category, @question, @answer)
    @view.card(@card)
  end
  
  def game
    deck = Deck.new(@category)
    @view.intro
    correct = 0
    incorrect = 0
    deck.cards.each do |card|
      guess = @view.game(card[0])
      if (card[1]).include? (guess)
        @view.response(true)
        correct += 1
      else
        @view.response(false)
        incorrect += 1
      end
    end
  @view.end_game(correct, incorrect)
  end
end

Controler.new ARGV