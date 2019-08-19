require_relative './peep'

class User

  attr_reader :name, :pass, :peeps, :details, :userid

  def initialize(name, pass)
    @name = name
    @pass = pass
    @userid = set_id
    @peeps = set_peeps
    @details = {"username" => name, "password" => pass}
  end

  def self.all
    result = $connection.exec("select * from users;")
    result.map{ |u|
      User.new(
        name: u['username'],
        pass: u['password']
      )
    }
  end

  def add_peep(body)
    p = Peep.create(body, @userid)
    @peeps << p
    set_peeps
  end

  private

  def set_id
    uid = $connection.exec("SELECT userid FROM users WHERE username = '#{$d.name}';").to_a.pop
    @userid = uid.fetch("userid").to_i
  end

  def set_peeps
    @peeps = Peep.all.select { |p| p.userid.to_i == @userid }
  end

end
