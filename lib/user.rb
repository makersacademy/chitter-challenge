require 'date'

class User
  attr_reader :id, :name, :email, :username, :created
  
  def initialize(id:, name:, email:, password:, username:, created:)
    @id = id
    @name = name
    @email = email
    @password = password
    @username = username
    @created = creation_timestamp(created)
  end

  def correct_password?(input_string)
    input_string == @password
  end

  private
  
  def creation_timestamp(created)
    @created = created.nil? ? DateTime.now : DateTime.parse(created)
  end
end
