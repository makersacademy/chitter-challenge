class Maker
  attr_reader :id, :name, :user_name, :email, :password
  def self.connection_helper
    if ENV['CHITTER_ENVIRON'] == 'test'
      dbname = 'chitter_test'
    else
      dbname = 'chitter'
    end
    @conn = PG.connect(dbname: dbname)
  end

  def self.create(name:, user_name:, email:, password: )
    connection_helper
    result = @conn.exec("INSERT INTO maker (name, user_name, email, password)
                        values('#{name}', '#{user_name}', '#{email}', '#{password}') RETURNING id,
                        name, user_name, email, password;").first
    Maker.new(id: (result['id']).to_i, name: result['name'],
              user_name: result['user_name'], email: result['email'], password: result['password'])
  end

  def self.read(id:)
    connection_helper
    result = @conn.exec("SELECT * FROM maker where id = #{id};").first
    Maker.new(id: (result['id']).to_i, name: result['name'],
              user_name: result['user_name'], email: result['email'], password: result['password'])
  end

  def initialize(id:, name:, user_name:, email:, password:)
    @id = id
    @name = name
    @user_name = user_name
    @email = email
    @password = password
  end
end
