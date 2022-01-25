require_relative 'database_connection'

class Chitter
  
  attr_reader :id, :message, :time, :author_id, :author_first_name, :author_surname, :author_email, :author_username, :author_profile_image_url

  def initialize(id:, message:, time:, author_id:, author_first_name:, author_surname:, author_email:, author_username:, author_profile_image_url:) 
    @id = id
    @message = message
    @time = time
    @author_id = author_id,
    @author_first_name = author_first_name,
    @author_surname = author_surname,
    @author_email = author_email,
    @author_username = author_username,
    @author_profile_image_url = author_profile_image_url
  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitter ORDER BY time;")
    result.map do |peep|
      Chitter.new(
        id: result[0]['id'],
        message: peep['message'],
        time: peep['time'],
        author_id: peep['author_id'],
        author_first_name: peep['author_first_name'],
        author_surname: peep['author_surname'],
        author_email: peep['author_email'],
        author_username: peep['author_username'],
        author_profile_image_url: peep['author_profile_image_url']
      )
    end
  end

  def self.create(message:, time:, author_id:, author_first_name:, author_surname:, author_email:, author_username:)
    result = DatabaseConnection.query(
      "INSERT INTO chitter (message, time, author_id, author_first_name, author_surname, author_email, author_username, author_profile_image_url) VALUES('#{message}', '#{time}', '#{author_id}', '#{author_first_name}', '#{author_surname}', '#{author_email}', '#{author_username}', '#{author_profile_image_url}') RETURNING message, time, author_id, author_first_name, author_surname, author_email, author_username, author_profile_image_url;"
    )
    Chitter.new(
      id: result[0]['id'],
      message: result[0]['message'],
      time: result[0]['time'],
      author_id: result[0]['author_id'],
      author_first_name: result[0]['author_first_name'],
      author_surname: result[0]['author_surname'],
      author_email: result[0]['author_email'],
      author_username: result[0]['username'],
      author_profile_image_url: result[0]['author_profile_image_url']
    )
  end 

end
