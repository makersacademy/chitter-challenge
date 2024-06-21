require_relative '../lib/user'
require 'pg'

class User

  attr_reader :id, :first_name, :last_name, :user_email, :user_password, :user_name

  def initialize(id:, first_name:, last_name:, user_email:, user_password:, user_name:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @user_email = user_email
    @user_password = user_password
    @user_name = user_name
  end

  def self.create(first_name:, last_name:, user_email: ,user_password:, user_name: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end 
        
    result = connection.exec_params(
            # The first argument is our SQL query template
            # The second argument is the 'params' referred to in exec_params
            # $1 refers to the first item in the params array
            # $2 refers to the second item in the params array
            "INSERT INTO user_chitter (first_name, last_name, user_email, user_password, user_name) VALUES($1, $2, $3, $4, $5) RETURNING id, first_name, last_name, user_email, user_password, user_name", [first_name, last_name, user_email, user_password, user_name]
         )
    User.new(id: result[0]['id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], user_email: result[0]['user_email'], user_password: result[0]['user_password'], user_name: result[0]['user_name'])
  end

end