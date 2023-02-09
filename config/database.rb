database_name = "chitter_#{Application.environment}"
db = URI.parse(ENV["DATABASE_URL"] || "postgres://localhost/#{database_name}")

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  :adapter => db.scheme == "postgres" ? "postgresql" : db.scheme,
  :host => db.host,
  :port => db.port,
  :username => db.user,
  :password => db.password,
  :database => "#{database_name}",
  :encoding => "utf8",
)
