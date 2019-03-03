class Maker
  attr_reader :id, :name, :user_name, :email
  def self.connection_helper
    if ENV['CHITTER_ENVIRON'] == 'test'
      dbname = 'chitter_test'
    else
      dbname = 'chitter'
    end
    @conn = PG.connect(dbname: dbname)
  end

  def self.create(name:, user_name:, email: )
    connection_helper
    result = @conn.exec("INSERT INTO maker (name, user_name, email)
                        values('#{name}', '#{user_name}', '#{email}') RETURNING id,
                        name, user_name, email;").first
    Maker.new(id: (result['id']).to_i, name: result['name'],
              user_name: result['user_name'], email: result['email'])
  end

  def self.read(id:)
    connection_helper
    result = @conn.exec("SELECT * FROM maker where id = #{id};").first
    Maker.new(id: (result['id']).to_i, name: result['name'],
              user_name: result['user_name'], email: result['email'])
  end

  def initialize(id:, name:, user_name:, email:)
    @id = id
    @name = name
    @user_name = user_name
    @email = email
  end
end
