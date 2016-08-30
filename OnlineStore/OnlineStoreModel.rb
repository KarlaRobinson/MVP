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

  def initialize(quantity = 20, color = Faker::Commerce.color, text = Faker::Company.name)
    @quantity = quantity
    @color = color
    @text =  text
  end

end

class Basket
  def create(user)
    puts "create #{user}"
    CSV.open("#{user.name.gsub(" ", "_")}Basket.csv", "wb") do |csv|
        csv << ["Quantity", "Color", "Text"]
    end
  end

  def add_item(user, product)
    CSV.open("#{user.name.gsub(" ", "_")}Basket.csv", "a+") do |csv|
        csv << [product.quantity, product.color, product.text]
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

  def get_user_info(name)
    arr = []
    CSV.foreach("OnlineStoreUsers.csv") do |row|
      next unless row[0] == name
      arr << [row[0], row[1]]
    end
    arr
  end
end

class UserBank

  def create
    CSV.open("OnlineStoreUsers.csv", "wb") do |csv|
        csv << ["Username", "Email", "Password"]
    end    
  end

  def register(user)
    CSV.open("OnlineStoreUsers.csv", "a+") do |csv|
        csv << [user.name, user.email, user.password]
    end
  end

  def index
    @users = []
    CSV.foreach("OnlineStoreUsers.csv") do |row|
    @users << User.new(row[0], row[1], row[2])
    end
    @users
  end

  def exists?(name)
    id = nil
    @users.each_with_index do |user, index|
      if user.name == name
        return id = index
      else 
        id = nil
      end
    end
    id
  end


  def auth(id, password)
    @users[id].password == password
  end
end

