require 'sqlite3'

class UserRepository
  DB = ENV['DB'] || "users.db"

  def self.schema
    db = SQLite3::Database.open DB
    db.execute "CREATE TABLE IF NOT EXISTS Users(id INTEGER PRIMARY KEY, name TEXT, dob TEXT)"
    db.close
  end

  def self.put(user)
    db = SQLite3::Database.open DB
    db.execute "INSERT INTO Users (name, dob) VALUES(?,?)", [user.name, user.dob.to_s]
    db.close
  end

  def self.get_dob(username)
    db = SQLite3::Database.open DB
    dob_raw = db.get_first_value "SELECT dob from Users where name = '#{username}' order by id DESC"
    db.close

    dob_raw
  end
end

