class Greeting
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def greeting
    user.is_birthday_today? ? birthday_greeting : non_birthday_greeting
  end

  private

  def birthday_greeting
    "Hello, #{user.name}! Happy birthday!"
  end

  def non_birthday_greeting
    "Hello, #{user.name}, birthday is in #{user.days_till_birthday} days"
  end
end

