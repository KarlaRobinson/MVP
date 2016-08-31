class View

  def initialize
  end

  def start(name, url)
    puts
    puts
    puts "_____________________________________________________________________"
    puts "Welcome to the online store: #{name}, (#{url})"
    puts "_____________________________________________________________________"
    puts "Select option number:"
    puts "1. Register"
    puts "2. Login"
    puts "3. Exit"
    STDIN.gets.chomp
  end

  def get_name
    puts "_____________________________________________________________________"
    puts "Let's get you into the store so you can start creating awesome shirts!"
    puts "_____________________________________________________________________"
    puts "Please enter your full name:"
    STDIN.gets.chomp
  end

  def get_email
    puts "Please enter your email:"
    STDIN.gets.chomp 
  end

  def create_password
    puts "Please create a six digit numeric password:"
    STDIN.gets.chomp
  end

  def get_password
    puts "Please enter your six digit password:"
    STDIN.gets.chomp
  end

  def failed
    puts "I'm sorry that is not a valid username. Please try again."
  end

  def failed2
    puts "The password is incorrect. Please try again."
  end

  def signed_in(name)
    puts "_____________________________________________________________________"
    puts "Welcome #{name}!"
    puts "Now you can have shirts 100% personalized!"
    puts "Let's get started on your order."
    puts "_____________________________________________________________________"
  end

  def get_shirt_text
    puts "Please type exactly what you would like the shirt/s to say:"
    STDIN.gets.chomp      
  end

  def get_shirt_qty
    puts "How many shirts do you need:"
    STDIN.gets.chomp
  end

  def get_shirt_color
    puts "Color:"
    STDIN.gets.chomp    
  end

  def checkout?
    puts "Great choice! Would you like to make another purchase?"
    STDIN.gets.chomp  
  end

  def finish
    puts "Thank you for shopping with us, your order has been placed!"
  end

  def exit
    puts "_____________________________________________________________________"
    puts "Sorry to see you go, please come back soon!"
    puts "_____________________________________________________________________"
  end

end
