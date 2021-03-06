require 'date'
require_relative './user_repository_mysql'

class User
  attr_reader :name, :dob

  def initialize(name, dob)
    @name = name
    @dob = Date.parse(dob)

    validate
    self
  end

  def validate
    raise ArgumentError.new("Name format in #{name} should be only the letters") unless name =~ /^[A-Za-z]+$/
    raise ArgumentError.new("Date of birth #{dob} should be a Date") unless dob.is_a? Date

    raise ArgumentError.new("Date of birth #{dob} must be a date before the today date") if dob > Date.today
    true
  end

  def self.from_db(username)
    dob = UserRepository.get_dob(username)

    raise ArgumentError.new("User #{username} entry not found") unless dob

    new(username, dob)
  end

  def save
    UserRepository.put(self)
  end

  def is_birthday_today?
    today = Date.today
    return today.month == dob.month && today.day == dob.day
  end

  def days_till_birthday
    today = Date.today
    year = today.year
    this_year_birth = Date.new(year, dob.month, dob.day)

    return (this_year_birth - today).to_int if this_year_birth > today

    next_year_birth = Date.new(year+1, dob.month, dob.day)
    (next_year_birth - today).to_int
  end
end
