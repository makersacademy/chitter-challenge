require 'pg'
require_relative 'db_connection'

class Peeper
  
  attr_reader :id, :name, :email, :peeper, :password
  
  def initialize(id:, name:, email:, peeper:, password:)
    @id = id
    @name = name
    @email = email
    @peeper = peeper
    @password = password
  end

  def self.create(name, email, peeper, password)    
    result = DbConnection.query("INSERT INTO peepers(name, email, peeper, password) VALUES('#{name}', '#{email}', '#{peeper}', '#{password}') RETURNING id, name, email, peeper, password;")
    Peeper.new(
      id: result[0]['id'], 
      name: result[0]['name'], 
      email: result[0]['email'],
      peeper: result[0]['peeper'],
      password: result[0]['password']
    )
  end

  def self.get(peeper)
    result = DbConnection.query("SELECT * FROM peepers WHERE peeper = '#{peeper.peeper}'")

    result.map do |peeper|
      Peeper.new(
        id: peeper['id'], 
        name: peeper['name'], 
        email: peeper['email'],
        peeper: peeper['peeper'],
        password: peeper['password']
      )
    end
  end


end