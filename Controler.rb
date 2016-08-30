# $ ruby todo.rb add Terminar el tutorial de jQuery
# ...
# $ ruby todo.rb index
# ...
# $ ruby todo.rb add
# ...
# $ ruby todo.rb delete <task_id>
# ...
# $ ruby todo.rb complete <task_id>
# ...
require_relative "model.rb"
require_relative "view.rb"

class Controler

  def initialize(arr_of_strings)
    @view = View.new
    @list = List.new
    @task_str = arr_of_strings[1..-1].join(" ")
    @method = arr_of_strings[0]
    add if @method == "add"
    index if @method == "index"
    delete if @method == "delete"
    complete if @method == "complete"
  end

  def add
  #["Comprar manzanas rojas", "Lavar la ropa", "Convertirme en un Developer Rock Star"]
  @task = Task.new(@task_str)
  @list.add(@task)
  @view.show_task(@task)
  end

  def index
    @view.index(@list.read)
  end

  def delete

    @view.delete(@list.read[@task_str.to_i])
    #@list.delete(@task_str.to_i)
  end

  def complete
    #Array(@arr_of_strings[2])
  end
end

Controler.new ARGV