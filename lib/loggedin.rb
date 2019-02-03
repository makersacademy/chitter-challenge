
class Loggedin
attr_reader :username, :password

def initialize(username: [nil], password: [nil])
  @username = username
  @password = password
end

def logout
  @username = nil
  @password = nil
end

end
