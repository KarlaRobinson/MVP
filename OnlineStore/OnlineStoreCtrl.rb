require_relative "OnlineStoreModel.rb"
require_relative "OnlineStoreView.rb"

#www.CustomTShirts.com

class Controler

  def initialize(arr_of_strings)
    @url = arr_of_strings.join("")
    @view = View.new
    @store = OnlineStore.new("Custom T-shirts", @url)
    @user_bank = UserBank.new
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
    @user = User.new(name, email, password)
    @user_bank.register(@user)
    @basket = Basket.new
    @basket.create(@user)
    print "\e[2J\e[H"
    @view.signed_in(name)
    add_item
  end

  def login
    @user_bank.index
    name = @view.get_name
    id = @user_bank.exists?(name)
    if id != nil
      auth(id, name)
    else
      @view.failed
    end
  end

  def auth(id, name)
    password = @view.get_password
    if @user_bank.auth(id, password)
      print "\e[2J"
      @view.signed_in(name)
      add_item
    else
      @view.failed2
    end
  end

private
  def add_item
    text = @view.get_shirt_text
    quantity = @view.get_shirt_qty
    color = @view.get_shirt_color
    @product = Product.new(quantity, color, text)
    @basket.add_item(@user, @product)
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