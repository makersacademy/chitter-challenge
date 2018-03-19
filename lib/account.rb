require_relative './database_connection_setup.rb'

class Account
  attr_reader :name, :id

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM account ORDER BY id ASC')
    result.map { |acc| Account.new(acc['id'], acc['name']) }
  end

  def self.setup(new_user)
    DatabaseConnection.query("INSERT INTO account (name) VALUES('#{new_user[:name]}');")
  end
end
