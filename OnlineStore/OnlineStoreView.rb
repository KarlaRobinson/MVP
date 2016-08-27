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

  def register
    puts "Please enter you full name:"
  end

  def get_name
    puts "Please enter your full name:"
    STDIN.gets.chomp
  end

  def get_password
    puts "Please enter your six digit password:"
    STDIN.gets.chomp
  end

  def signed_in(name)
    puts "_____________________________________________________________________"
    puts "Welcome #{name}!"
    puts "Let's create your order."
  end

  def exit
    puts "_____________________________________________________________________"
    puts "Sorry to see you go, please come back soon!"
    puts "_____________________________________________________________________"
  end

end
