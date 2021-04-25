require 'pg'

class User

  def self.create(email:,name:,handle:,password:)
    # insert new user to DB
  end

  def new_cheep
    # triggers Peep.create
  end
end


# | user_id |     email         | name      | handle      | password |
# |---------|-------------------|-----------|-------------|----------|
# | 1       | william@gmail.com	| bill      | billy123    | bad_pw   |
# | 2       |	jessica@gmail.com | jess      | knock_knock | vbad_pw  |
