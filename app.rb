require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'lib/database_connection'
require_relative 'lib/post'
require_relative 'lib/user'

# Establish the database connection
establish_database_connection

class Application < Sinatra::Base
  enable :sessions
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

  post '/account_page' do
    current_time = Time.now + 1 * 60 * 60 # Get the current time with GMT offset
    Post.create_post(current_time, params[:message], session[:user_id])
    
    # Append the new post to the class variable
    @@posts.unshift("#{current_time} #{User.find(session[:user_id]).name} #{User.find(session[:user_id]).username} #{params[:message]}")
    
    redirect '/account_page'
  end
  

  get '/signup' do
    erb(:signup)
  end

  get '/login' do
    erb(:login)
  end

  get '/logout' do
    session.clear  
    redirect '/' 
  end

  get '/login_failure' do
    erb(:login_failure)
  end

  post '/login' do
    user = User.sign_in(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/account_page'
    else
      redirect '/login_failure'
    end
  end
  
  

  get '/account_page' do
    if session[:user_id].nil?
      # No user id in the session
      # so the user is not logged in.
      redirect '/login'
    else
      # The user is logged in, display their account page.
      erb(:account)
    end
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
