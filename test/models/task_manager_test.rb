require_relative "../test_helper"

class TaskManagerTest < Minitest::Test

  def test_it_creates_a_task
    attributes = {id: 1, description: 'This task', title: "New task"}
    TaskManager.create(attributes)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "This task", task.description
    assert_equal "New task", task.title
  end

  def test_it_updates_a_task
    attributes = {id: 1, description: 'This task', title: "New task"}
    TaskManager.create(attributes)
    attributes = {id: 1, description: 'This other task', title: "This better task"}
    TaskManager.update(1, attributes)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "This other task", task.description
    assert_equal "This better task", task.title
  end

  def test_it_finds_a_task
    attributes = {id: 1, description: 'This task', title: "New task"}
    TaskManager.create(attributes)
    secret_task = TaskManager.find(1)

    assert_equal "This task", secret_task.description
    assert_equal "New task", secret_task.title
  end

  def test_it_destroys_a_task
    attributes = {id: 1, description: 'This task', title: "New task"}
    TaskManager.create(attributes)
    attributes = {id: 2, description: 'This second task', title: "New task two"}
    TaskManager.create(attributes)
    TaskManager.delete(2)
    remaining_tasks = TaskManager.all

    assert_equal 1, remaining_tasks.size
  end

  def test_it_displays_all_tasks
    attributes = {id: 1, description: 'This task', title: "New task"}
    TaskManager.create(attributes)
    attributes = {id: 2, description: 'This second task', title: "New task two"}
    TaskManager.create(attributes)
    all_tasks = TaskManager.all

    assert_equal 2, all_tasks.count
  end
end
