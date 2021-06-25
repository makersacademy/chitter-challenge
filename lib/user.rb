class User
  attr_reader :id, :name, :email, :password, :dob

  def initialize(id:, name:, email:, password:, dob:)
    @id = id
    @name = name
    @email = email
    @password = password
    @dob = dob
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'users_test')      
    else
      connection = PG.connect(dbname: 'users')   
    end

    result = connection.exec("SELECT * FROM users WHERE email = #{@email};")
  end

  def self.sign_up(name:, email:, password:, dob:)
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'users_test')      
    else
      connection = PG.connect(dbname: 'users')   
    end

    p emails = connection.exec("SELECT email FROM users;")
    emails.each do |user_email|
      if email == user_email['email']
        p user_email['email']
        return "Sorry, email already in use"
      end
    end
    p @email = connection.exec("INSERT INTO users (name, email, password, dob) VALUES('#{name}', '#{email}', '#{password}', '#{dob}') RETURNING name, email;")
  end
end