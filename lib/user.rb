class User
  attr_reader :email
  def self.create(email, pass)
    begin
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect :dbname => "chitter_chatter_test"
    else
      connection = PG.connect :dbname => "chitter_chatter"
    end
    add_user = connection.exec("INSERT INTO users (email, pass) VALUES ('#{email}', '#{pass}');")
  rescue PG::Error => e
    puts e.message
  ensure
    add_user.clear if add_user
    connection.close if connection
  end
  end

  def self.find(email)

  end

  def initialize(email:, pass:)
    @email = email
    @pass = pass
  end
end