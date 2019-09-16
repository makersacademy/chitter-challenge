class User
  attr_reader :id, :name, :email

  # def self.create(user_id, user, submission_time, content)
  #   r = DBcon.query("INSERT INTO peep (content, submission_time, user_id)
  #   VALUES ('#{content}', '#{submission_time}', #{user_id}) RETURNING peep_id, content, submission_time, user_id;")
  #   Peep.new(r[0]['peep_id'], r[0]['user_id'].to_i, user, r[0]['submission_time'], r[0]['content'])
  # end

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
