require 'sequel'

class UserRepository
  database_url = ENV['DATABASE_URL'] || "mysql2://root:@localhost/devops-test"
  DB = Sequel.connect(database_url)

  def self.schema
    if !DB.table_exists?(:users)
      DB.create_table :users do
        primary_key :id
        String :name, unique: false, null: false
        Text :dob, null: false
      end
    end
  end

  def self.put(user)
    users = DB[:users]
    users.insert(name: user.name, dob: user.dob.to_s)
  end

  def self.get_dob(username)
    user = DB["SELECT dob FROM users WHERE name = ?", username]
    !user.empty? && user.first[:dob]
  end
end

