require_relative "OnlineStoreModel.rb"
require_relative "OnlineStoreView.rb"

#www.CustomTShirts.com

class Controler

  def initialize(arr_of_strings)
    @url = arr_of_strings.join("")
    @view = View.new
    @user1 = User.new("Karla Robinson", "karla@gmail.com", "333444")
    @store = OnlineStore.new("Custom T-shirts", @url)
    start
  end

  def start
  input = @view.start(@store.name, @store.url)
    if input == "1"
      register
    elsif input == "2"
      login
    else
      @view.exit
    end 
  end

  def register
    @view.register
  end

  def login
    name = @view.get_name
    password = @view.get_password
    @user1
    @view.signed_in(name)
  end

  def create_shirt
    
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