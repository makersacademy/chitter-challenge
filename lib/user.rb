require 'pg'

class Peep

  attr_reader :id, :email_address, :password

  def initialize(id:, message:)
    @id = id
    @email_address = email_address
    @password = password
  end
end