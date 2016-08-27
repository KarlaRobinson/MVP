require 'csv'
require 'faker'

class OnlineStore
attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end
end

class Product
attr_reader :quantity, :color, :text

  def initialize(name, quantity = 20, color = Faker::Commerce.color, text = Faker::Company.name)
    @name = name
    @quantity = quantity
    @color = color
    @text =  text
  end

  def basket
    CSV.open("OnlineStoreBaskets.csv", "a+") do |csv|
        csv << [@user.name, @user.email, @user.password]
    end
  end
end

class User
attr_reader :name, :email, :password

  def initialize(name = Faker::Name.name, email = Faker::Internet.free_email, password = Array(1..9).shuffle!.join("")[0..5])
    @name = name
    @email = email
    @password = password
  end

  def register
    # CSV.open("OnlineStoreUsers.csv", "a+") do |csv|
    #     csv << [@user.name, @user.email, @user.password]
    # end
    puts @name
    puts @email
    puts @password
  end

  def get_user_info(name)
    arr = []
    CSV.foreach("OnlineStoreUsers.csv") do |row|
      next unless row[0] == name
      arr << [row[0], row[1]]
    end
    arr
  end

  def auth(password)
    password == @password ? true : false
  end
end

