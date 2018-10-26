class User

  attr_reader :id, :email, :name, :user, :pass

  def initialize(id, email, name, user, pass, confirm = pass)
    @email = email
    @name = name
    @user = user
    @pass = pass
    @confirm = confirm
    @id = id
  end

  def self.create(email, name, user, pass, _confirm = pass)
    return 'not unique' if check_if_unique(user) == 'not unique'
    Database.query("INSERT INTO auth (username, PASSWORD, email, name)
    VALUES ('#{user}', '#{pass}', '#{email}', '#{name}');")
    find_by_username(user)
  end

  def self.find_by_username(user)
    rs = Database.query("SELECT * FROM auth WHERE username = '#{user}'")
    User.new(rs[0]['id'], rs[0]['email'], rs[0]['name'], rs[0]['username'], rs[0]['pass'])
  end

  def self.login(user, pass)
    rs = Database.query("SELECT * FROM auth WHERE username = '#{user}'")
    return "fail" if rs.ntuples == 0
    return "fail" if check_password(pass, rs[0]['password']) == false
    User.new(rs[0]['id'], rs[0]['email'], rs[0]['name'], rs[0]['username'], rs[0]['password'])
  end

  def self.check_if_unique(user)
    rs = Database.query("SELECT * FROM auth WHERE username = '#{user}';")
    return "not unique" if rs.ntuples != 0
  end

  def self.add(_user_instance)
    Database.query("INSERT INTO auth (username, PASSWORD, email, name)
    VALUES ('#{user.user}', '#{user.pass}', '#{user.email}', '#{user.name}');")
    p 'user registered'
  end

  private

  def self.check_password(entered_pass, stored_pass)
    entered_pass == stored_pass
  end

end
