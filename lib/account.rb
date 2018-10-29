require 'pg'

class Account
  attr_reader :id, :user_name, :first_name
  def initialize(id:, user_name:, first_name:)
    @user_name = user_name
    @first_name = first_name
  end
  def self.create(first_name:, last_name:, user_name:, password:, email:)
    result = DatabaseConnection.query("INSERT INTO users (first_name, last_name, user_name, password, email) VALUES('#{first_name}', '#{last_name}', '#{users}', '#{password}', '#{email}') RETURNING id, user_name, first_name;")
    Account.new(id: result[0]['id'], user_name: result[0]['user_name'], first_name: result[0]['first_name'])
  end
end
