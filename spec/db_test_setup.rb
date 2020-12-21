require "pg"

p "Test database..."

def reset_table
  connect = PG.connect(dbname: "chitter_test")
  # Clear the posts table
  connect.exec("TRUNCATE posts;")
end

def add_post
  connect = PG.connect(dbname: "chitter_test")
  # Add the test data
  connect.exec("INSERT INTO posts VALUES(1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.');")
  connect.exec("INSERT INTO posts VALUES(2, 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.');")
  connect.exec("INSERT INTO posts VALUES(3, 'When an unknown printer took a galley of type and scrambled it to make a type specimen book.');")
end
