require 'digest'
require 'identicon'
require_relative '../database'

=begin
CREATE TABLE chitter_user (
  email varchar(255) PRIMARY KEY,
  password varchar(255) NOT NULL,
  username varchar(255) UNIQUE,
  name varchar(255) NOT NULL,
  image text
);
=end

class User
  def self.create(params)
    connection = Database.connection

    email = params[:email]
    password = Digest::SHA2.hexdigest(params[:password])
    username = params[:username]
    name = params[:name]
    image = Identicon.data_url_for username

    connection.exec_params("INSERT INTO chitter_user VALUES ($1, $2, $3, $4, $5)",
                           [email, password, username, name, image])
  end

  def self.login(params)
    connection = Database.connection

    username = params[:username]
    password = Digest::SHA2.hexdigest(params[:password])

    user = connection.exec_params("SELECT * FROM chitter_user WHERE username = $1",
                                  [username]).first
    
    return nil if (user.nil? || user['password'] != password)

    return user
  end
end
