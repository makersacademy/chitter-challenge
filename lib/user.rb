require 'pg'

  class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end