require 'pg'

class User

  attr_reader :id, :author_name, :author_handle, :email, :password

  def initialize(id, author_name, author_handle, email, password)
    @id = id
    @author_name = author_name
    @author_handle = author_handle
    @email = email
    @password = password
  end

  def self.create(author_name, author_handle, email, password)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect( dbname: 'Chitter_test' )
    else
      connection = PG.connect( dbname: 'Chitter' )
    end
    result = connection.exec("INSERT INTO users (author_name, author_handle, email, password)
    VALUES('#{author_name}', '#{author_handle}', '#{email}', '#{password}')
    RETURNING id, author_name, author_handle, email, password
    ")
    User.new(result[0]['id'], result[0]['author_name'], result[0]['author_handle'], result[0]['email'], result[0]['password'])
  end

  def self.all_handles
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect( dbname: 'Chitter_test' )
    else
      connection = PG.connect( dbname: 'Chitter' )
    end
    result = connection.exec "SELECT author_handle FROM users"
    result.map { |user_handle| user_handle['author_handle'] }
  end

  def self.all_emails
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect( dbname: 'Chitter_test' )
    else
      connection = PG.connect( dbname: 'Chitter' )
    end
    result = connection.exec "SELECT email FROM users"
    result.map { |user_email| user_email['email'] }
  end

  def self.all
   if ENV['RACK_ENV'] == 'test'
     connection = PG.connect( dbname: 'Chitter_test' )
   else
     connection = PG.connect( dbname: 'Chitter' )
   end
   result = connection.exec "SELECT * FROM users"
   result.map { |user| User.new(user['id'], user['author_name'], user['author_handle'], user['email'], user['password']) }
 end

end
