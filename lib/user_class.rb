class User

  attr_reader :id, :email, :password

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("insert into users (email, password)
    values('#{email}', '#{password}') RETURNING id, email, password")
    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])
  end
end
