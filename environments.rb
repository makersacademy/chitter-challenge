require 'sinatra'

# configure :test do
#   set :database, {
#     adapter: 'postgresql',
#     encoding: 'unicode', 
#     database: 'chitter_test', 
#     # pool: 2, 
#     # username: 'your_username', 
#     # password: 'your_password'
#   }

#   set :show_exceptions, true
# end

configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode', 
    database: 'chitter_development', 
    # pool: 2, 
    # username: 'your_username', 
    # password: 'your_password'
  }

  set :show_exceptions, true
end

configure :production do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode', 
    database: 'chitter_production', 
    # pool: 2, 
    # username: 'your_username', 
    # password: 'your_password'
  }
end

# configure :test, :development do
#  set :database, 'sqlite:///dev.db'
#  set :show_exceptions, true
# end

# configure :production do
#  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

#  ActiveRecord::Base.establish_connection(
#    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#    :host     => db.host,
#    :username => db.user,
#    :password => db.password,
#    :database => db.path[1..-1],
#    :encoding => 'utf8'
#  )
# end
