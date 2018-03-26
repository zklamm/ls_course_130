require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_raise_type_error
    assert_raises(TypeError) { @list << 5 }
    assert_raises(TypeError) { @list << 'str' }
  end

  def test_shovel_operator
    todo = Todo.new('Test this')
    @list << todo
    assert_includes(@list.to_a, todo)
  end

  def test_add
    todo = Todo.new('Test this too')
    @list.add(todo)
    assert_includes(@list.to_a, todo)
  end

  def test_item_at
    assert_equal(@todos.fetch(0), @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at
    assert_equal(@todo2.done!, @list.mark_done_at(1))
  end

  def test_mark_undone_at
    assert_equal(@todo3.undone!, @list.mark_undone_at(2))
  end

  def test_done!
    @todos.map(&:done!)
    assert_equal(@todos, @list.done!.to_a)
  end

  def test_remove_at
    @list.remove_at(2)
    assert_raises(IndexError) { @list.item_at(2) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s2
    @todo1.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s3
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    testing1 = []
    testing2 = []
    @todos.each { |todo| testing1 << todo }
    @list.each { |todo| testing2 << todo }
    assert_equal(testing1, testing2)
  end

  def test_each_return
    return_value = @list.each { |todo| nil }
    assert_equal(return_value, @list)
  end

  def test_select
    @list.done!
    selected = @list.select { |todo| todo.done? }
    assert_equal(selected.to_a, @list.to_a)
  end
end
