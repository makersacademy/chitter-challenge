require 'pg'

class User

attr_reader :username, :password, :name, :email, :id

  def initialize(id, username, password, name, email)
    @id = id
    @username = username
    @password = password
    @name = name
    @email = email
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'user_test')
    else
      connection = PG.connect(dbname: 'user')
    end

    result = connection.exec('SELECT * FROM user;')
    result.map { |row| User.new(row['id'], row['username'], row['password'], row['name'], row['email']) }
  end

  def self.create(username, password, name, email)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'user_test')
    else
      connection = PG.connect(dbname: 'user')
    end

    person = connection.exec("INSERT INTO public.user (username, password, name, email) VALUES ('#{username}', '#{password}', '#{name}', '#{email}') RETURNING id, username, password, name, email;")
    p person
    User.new(person[0]["id"], person[0]["username"], person[0]["password"], person[0]["name"], person[0]["email"])
  end

  # def self.sign_in(username, password)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'user_test')
  #   else
  #     connection = PG.connect(dbname: 'user')
  #   end
  #   person = connection.exec("SELECT username, password FROM public.user WHERE username = '#{username}' AND password = '#{password}';")
  #   return true if person != nil
  # end
end
