require "pg"
require "bcrypt"
p "Test database..."

def reset_table
  connect = PG.connect(dbname: "chitter_test")
  # Clear the posts table
  connect.exec("TRUNCATE posts, users;")
end

def add_data
  connect = PG.connect(dbname: "chitter_test")
  # Adding an user
  password = "admin"
  encrypted_password = BCrypt::Password.create(password)
  connect.exec("INSERT INTO users VALUES('admin', 'Admin','Admin','admin@admin.com','#{encrypted_password}');")
  # Adding a post
  connect.exec("INSERT INTO posts VALUES(1, 'Lorem Ipsum','Saturday, 02/Jan/21 at 04:28 PM', 'admin');")
end
