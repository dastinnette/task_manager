require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_user_sees_index_of_tasks
    visit "/"
    assert page.has_content?("Welcome to Task Manager")
  end

  def test_frontpage_has_welcome_in_greeting
    visit "/"
    within("#greeting") do
      assert page.has_content?("Welcome to Task Manager")
    end
  end
end
