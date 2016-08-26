class View

  def initialize
  end

  def intro
    puts "Welcome to Guess. We will ask you a question and you must put the correct answer."
    sleep(1)
  end

  def card(card)
    puts "Your just added the question: \"#{card.question}\","
    puts "to the \"#{card.category}\" deck,"
    puts "with the answer: \"#{card.answer}.\""
  end

  def game(card)
    puts card
    STDIN.gets.chomp
  end

  def response(boolean)
    if boolean == true
      sleep(1)
      puts "You got it!"
    else
      sleep(1)
      puts "Sorry, that is incorrect."
    end
  end

  def end_game(correct, incorrect)
    if correct > incorrect
      puts "Nice work! You got #{correct} right and #{incorrect} wrong."
      puts "You are ready to try another deck!"
    else
      puts "You got #{correct} right and #{incorrect} wrong but you can try again!"
    end
  end
end










