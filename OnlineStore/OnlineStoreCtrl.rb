require_relative "OnlineStoreModel.rb"
require_relative "OnlineStoreView.rb"

#www.CustomTShirts.com

class Controler

  def initialize(arr_of_strings)
    @url = arr_of_strings.join("")
    @view = View.new
    @store = OnlineStore.new("Custom T-shirts", @url)
    start
  end

  def start
  input = @view.start(@store.name, @store.url)
    if input == "1"
      print "\e[2J\e[H"
      register
    elsif input == "2"
      print "\e[2J\e[H"
      login
    else
      @view.exit
    end 
  end

  def register
    name = @view.get_name
    email = @view.get_email
    password = @view.create_password
    User.new(name, email, password).register
    print "\e[2J\e[H"
    @view.signed_in(name)
    #create_shirt
  end

  def login
    name = @view.get_name
    password = @view.get_password
    @user1
    print "\e[2J"
    @view.signed_in(name)
    #auth?
    #if successful create_shirt
  end

  def create_shirt
    #checkout
  end

  def checkout
    
  end

end

Controler.new ARGV

# register
# auth login
# create custom shirt
# checkout

# Faker::Commerce.color #=> "lavender"
# Faker::Company.name #=> "Hirthe-Ritchie"
# Faker::Company.logo #=> "http://pigment.github.com/fake-logos/logos/medium/color/5.png"