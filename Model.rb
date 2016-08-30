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
    CSV.open("TestList.csv", "wb") do |csv|  
        read.each_with_index do |object, index|
          next if index == row_to_delete
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

