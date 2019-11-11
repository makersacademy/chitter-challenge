class User

  attr_reader :name, :password

  def initialize(name:, password:)
    @name = name
    @password = password
  end

  def self.create(name:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_challenge_test')
    else
      conn = PG.connect(dbname: 'chitter_challenge')
    end
    result = conn.exec("INSERT INTO users (name, password) VALUES('#{name}', '#{password}') RETURNING name, password")
    User.new(name: result[0]['name'], password: result[0]['password'])
  end
end
