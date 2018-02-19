require 'pg'
require 'uri'
require './lib/database_connection'

class User

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def self.add_new_user(id)
    DatabaseConnection.query("INSERT INTO peeps(id) VALUES('#{id}')")
  end

end