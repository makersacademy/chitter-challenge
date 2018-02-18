
class User

  attr_reader :name, :password

  def initialize(name,password)
    @name = name
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM newuser")
    p result.map{|user| User.new( user['name'], user['password'])}
  end

  def self.sign_in(name,password)
   DatabaseConnection.query("INSERT INTO newuser(name, password) VALUES('#{name}', '#{password}') ")
  end

end
