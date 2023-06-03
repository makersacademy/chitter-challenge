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
    @@posts = Post.all_peeps.reverse
  end

  get '/' do
    erb(:index)
  end

  post '/' do
    current_time = Time.now + 1 * 60 * 60 # Get the current time with GMT offset
    Post.create(time: current_time, message: params[:message], user_id: 1)
    
    # Append the new post to the class variable
    @@posts.unshift("#{current_time} #{User.find(1).name} #{User.find(1).username} #{params[:message]}")
    
    
    redirect '/'
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    database = User.all_records
    match_found = false
  
    database.each do |record|
      if record.username == params[:username] || record.email == params[:email]
        match_found = true
        break
      end
    end
  
    if match_found
      redirect '/signup'
    else
      User.create_user(params[:name], params[:username], params[:email], params[:password])
      redirect '/success'
    end
  end

  get '/success' do
    erb(:success)
  end
end
