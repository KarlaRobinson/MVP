
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

  def delete(task)
    puts "Task deleted: #{task[0]}"
    p task[1]
    if task[1] == "true"
      puts "Nice work. This task was completed."
    elsif task[1] == "false"
      puts "Be careful. This task had not yet been completed."
    end
  end
end