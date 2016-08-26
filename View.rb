
class View

  def initialize
    
  end

  def show_task(task)
    puts "Task created: #{task.name}"
  end

  def index(arr)
    i = 1
    arr.each do |arr2|
      puts "#{i}. #{arr2[0]}"
      i += 1
    end
  end
end