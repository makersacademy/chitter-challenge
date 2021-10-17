require 'pg'

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
    # Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])

  end

  # def self.find(id:)

  # end

end