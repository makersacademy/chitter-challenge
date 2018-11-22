require 'pg'

class Peep

  def self.create(username:, content:)
    connection = PG.connect dbname: 'chitter'
    connection.exec "INSERT INTO peeps (username, content)
                     VALUES('#{username}', '#{content}');"
  end

end
