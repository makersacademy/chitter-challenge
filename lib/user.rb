class User
  attr_reader :id, :name, :email

  def self.create(name, email)
    r = DBcon.query("INSERT INTO users (name, email)
    VALUES ('#{name}', '#{email}') RETURNING id, name, email;")
    User.new(r[0]['id'].to_i, r[0]['name'], r[0]['email'])
  end

  def self.all
    rs = DBcon.query('SELECT * FROM users;')
    rs.map { |b| User.new(b['id'].to_i, b['name'], b['email']) }
  end

  def self.find_username(id)
    rs = DBcon.query("SELECT * FROM users where id = #{id};")
    rs.values[0][1]
  end

  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end
end
