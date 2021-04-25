require 'pg'

class User

  def self.create(email:,name:,handle:,password:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO chitter_users (email, name, handle, password) VALUES ('#{email}', '#{name}', '#{handle}', '#{password}') RETURNING email, name, handle, password;")
  end

  def new_peep
    # triggers Peep.create
  end
end


# | user_id |     email         | name      | handle      | password |
# |---------|-------------------|-----------|-------------|----------|
# | 1       | william@gmail.com	| bill      | billy123    | bad_pw   |
# | 2       |	jessica@gmail.com | jess      | knock_knock | vbad_pw  |
