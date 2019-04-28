require 'pg'

class User
  def self.create(fname, lname, email, password)
    connection = PG.connect(:dbname, 'chitter')
    new_user = connection.exec('INSERT INTO USERS (firstname, lastname, email, password)')
  end
end