require 'csv'

class List
  def initialize
  end

  def read
    arr = []
    CSV.foreach("TestList.csv") do |row|
    arr << row
    end
    arr
  end

  def add(object)
    CSV.open("TestList.csv", "a+") do |csv|      
        csv << [object.name, object.completed]
      end
  end

  def delete(row_to_delete)
    arr = read
    CSV.open("TestList.csv", "wb") do |csv|  
      arr.each_with_index do |object, index|
        next if index == row_to_delete
        csv << [object[0], object[1]]
      end
    end    
  end

  def complete(row_to_complete)
    arr = read
    CSV.open("TestList.csv", "wb") do |csv|  
      arr.each_with_index do |object, index|
        object[1] = "true" if index == row_to_complete
        csv << [object[0], object[1]]
      end
    end    
  end
end

class Task
attr_reader :name, :completed

  def initialize(name, completed = false)
    @name = name
    @completed = completed
  end
end


# ruby Controler.rb add eat
# ruby Controler.rb add drink
# ruby Controler.rb add sleep
# ruby Controler.rb add clean