# set the database based on the current environment
database_name = "chitter-#{Chitter.environment}"
db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")

# connect ActiveRecord with the current database
ActiveRecord::base.establish_connection(
  :adapter => db.scheme == "postgres" ? "postgresql" : db.scheme,
  :host => db.host,
  :port => db.port,
  :usernmae => db.user,
  :password => db.password,
  :database => "#{database_name}"
  :encoding => "utf8"
)