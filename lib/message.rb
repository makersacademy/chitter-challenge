require 'pg'

class Message

  def self.display
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    result = connection.exec("SELECT * FROM chitter")
    result.map { |tweet| tweet['message'] }
  end

  # def self.create(id:, message:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'chitter_challenge_test')
  #   else
  #     connection = PG.connect(dbname: 'chitter_challenge')
  #   end
  #   connection.exec("INSERT INTO chitter VALUES(#{id} #{message})")
  # end



end
