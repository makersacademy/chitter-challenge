require 'pg'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end

    result = connection.exec "SELECT * FROM peeps"
    result.field_values('message')
  end

  def self.add_peep(user_id, message)
    @user_id = user_id
    @message = message

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
    connection.exec("INSERT INTO peeps (user_id, message) VALUES('#{@user_id}', '#{@message}');")
  end
end
