class User

  attr_reader :email, :name, :user, :pass

  def initialize(email, name, user, pass, confirm = pass)
    @email = email
    @name = name
    @user = user
    @pass = pass
    @confirm = confirm
  end

  def self.login(user, pass)
    rs = Database.query("SELECT * FROM auth WHERE username = '#{user}'")
    # raise "Invalid Username" if rs.ntuples == 0
    User.new(rs[0]['email'], rs[0]['name'], rs[0]['user'], rs[0]['pass'], rs[0]['user'])
  end

  def self.check(user)
    rs = Database.query("SELECT * FROM auth WHERE username = '#{user.user}';")
    p rs.ntuples
    raise "Username or email already exists" if rs.ntuples != 0
    self.add(user)
  end

  def self.add(user)
    Database.query("INSERT INTO auth (username, PASSWORD, email, name)
    VALUES ('#{user.user}', '#{user.pass}', '#{user.email}', '#{user.name}');")
  end

end
