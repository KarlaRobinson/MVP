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
end

class Task
attr_reader :name, :completed

  def initialize(name, completed = false)
    @name = name
    @completed = completed
  end
end


#Task.new("sweep", false)