# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    @todos.each do |todo|
      list << todo if yield(todo)
    end
    list
  end

  # find_by_title takes a string as argument, and returns the first Todo object
  # that matches the argument. Return nil if no todo is found.
  def find_by_title(str)
    select { |todo| todo.title == str }.first
  end

  # all_done returns new TodoList object containing only the done items
  def all_done
    select(&:done?)
  end

  # all_not_done returns new TodoList object containing only the not done items
  def all_not_done
    select { |todo| !todo.done? }
  end

  # mark_done takes a string as argument, and marks the first Todo object that
  # matches the argument as done.
  def mark_done(str)
    find_by_title(str) && find_by_title(str).done!
  end

  # mark_all_done: mark every todo as done
  def mark_all_done
    each(&:done!)
  end

  # mark_all_undone: mark every todo as not done
  def mark_all_undone
    each(&:undone!)
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)

todo1.done!

puts list.find_by_title("Buy milk")
puts list.all_done
puts list.all_not_done
list.mark_done("Go to gym")
puts list
list.mark_all_done
puts list
list.mark_all_undone
puts list
