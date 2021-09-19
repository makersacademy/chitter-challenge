class User
  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect( dbname: 'chitter_test' )
    else
      connection = PG.connect( dbname: 'chitter' )
    end
    result = connection.exec_params( "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email, password;", [email, password] )
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect( dbname: 'chitter_test' )
    else
      connection = PG.connect( dbname: 'chitter' )
    end
    result = connection.exec( "SELECT * FROM users WHERE id = $1", [id] )
    User.new(id: result[0]['id'], email: result[0]['email'] )
  end
end