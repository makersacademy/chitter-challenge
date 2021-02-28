def create_user(name, lastname, username, email, password)
  connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
  connection.exec("INSERT INTO users (name, lastname, username, email, password) VALUES('#{name}', '#{lastname}', '#{username}', '#{email}', '#{password}') RETURNING id, name, lastname, username, email, password").first
end
