require_relative '../database_connection_setup'

class User < ActiveRecord::Base
  def self.register(name:, email:, username:, password:)
    create(
      name: name,
      email: email,
      username: username,
      password: password
    )
  end

  def self.find_by_id(id)
    find_by(id: id)
  end
end
