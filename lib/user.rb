require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :email

  def initialize(id:, email:, password_digest:)
    @id = id
    @email = email
    @password_digest = password_digest
  end

  def self.sign_up(email:, password:)

    password_digest = BCrypt::Password.create(password)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.prepare('statement1', 'INSERT INTO users (email, password_digest) VALUES($1, $2) RETURNING id, email, password_digest')
    result = connection.exec_prepared('statement1', [email, password_digest])

    User.new(id: result[0]['id'], email: result[0]['email'], password_digest: result[0]['password_digest'])


  end
end
