# sets the current database based on the current environment 
# (the env is derived from the application class in app.rb)

database_name = "chitter-#{Application.environment}"
db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")

# connects to ActiveRecord with the current database

ActiveRecord::Base.establish_connection(
  :adapter => db.scheme == "postgres" ? "postgresql" : db.scheme,
  :host => db.host,
  :port => db.port,
  :username => db.user,
  :password => db.password,
  :database => database_name,
  :encoding => "utf8"
)
