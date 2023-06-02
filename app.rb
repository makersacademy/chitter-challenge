require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'lib/database_connection'
require_relative 'lib/post'
require_relative 'lib/user'

# Establish the database connection
establish_database_connection

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/database_connection'
    also_reload 'lib/post'
    also_reload 'lib/user'
  end

  configure do
    # Set the default timezone to GMT
    ENV['TZ'] = 'GMT'
  end

  get '/' do
    @posts = Post.all_peeps.reverse
    erb :index
  end

  post '/' do
    current_time = Time.now + 1 * 60 * 60 # Get the current time with GMT offset
    Post.create(time: current_time, message: params[:message], user_id: 1)
    redirect '/'
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect '/success'
  end

  get '/success' do
    erb(:success)
  end
end
