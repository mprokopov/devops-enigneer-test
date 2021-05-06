require "minitest/autorun"
require_relative "../src/user_repository"
require_relative "../src/user"


class TestUser < Minitest::Test
  def test_days_till_birthday_this_year
    user = User.new("nexus", "1979-09-26")
    today = Date.new(2021,9,25)

    Date.stub(:today, today) {
      assert_equal 1, user.days_till_birthday
    }
  end

  def test_days_till_birthday_next_year
    user = User.new("nexus", "1979-09-26")
    today = Date.new(2021,9,27)

    Date.stub(:today, today) {
      assert_equal 364, user.days_till_birthday
    }
  end

  def test_is_birthday_today_true
    user = User.new("nexus", "1979-09-27")
    today = Date.new(2021,9,27)

    Date.stub(:today, today) {
      assert user.is_birthday_today?
    }
  end

  def test_is_birthday_today_false
    user = User.new("nexus", "1979-09-26")
    today = Date.new(2021,9,27)

    Date.stub(:today, today) {
      assert_equal false, user.is_birthday_today?
    }
  end

  def test_validate_success
      assert User.new("nexus", "1979-01-01").validate
  end

  def test_validate_name
    assert_raises ArgumentError do
      User.new("nexus123", "1979-01-01")
    end
  end

  def test_validate_birthday_greater_than_today
    today = Date.new(2021,9,27)
    Date.stub(:today, today) do
      ex = assert_raises(ArgumentError) do
        User.new("nexus", "2021-09-28")
      end
      assert_equal ex.message, "Date of birth 2021-09-28 must be a date before the today date"
    end
  end

  def test_validate_birthday
    assert_raises ArgumentError do
      User.new("nexus", "aaaa")
    end
  end
end
