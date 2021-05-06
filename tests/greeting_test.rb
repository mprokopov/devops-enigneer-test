require "minitest/autorun"
require "../greeting.rb"


class TestUser < Minitest::Test

  def test_birthday_today
    user = Minitest::Mock.new
    user.expect :name, "Maksym"
    user.expect :is_birthday_today?, true

    assert_equal Greeting.new(user).greeting, "Hello, Maksym! Happy birthday!"
  end

  def test_birthday_not_today
    user = Minitest::Mock.new
    user.expect :name, "Maksym"
    user.expect :is_birthday_today?, false
    user.expect :days_till_birthday, 100

    assert_equal Greeting.new(user).greeting, "Hello, Maksym, birthday is in 100 days"
  end
end
