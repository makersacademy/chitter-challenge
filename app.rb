require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require_relative 'models/user'
require_relative 'models/peep'

class Application < Sinatra::Base
  enable :sessions
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::ActiveRecordExtension
    register Sinatra::Reloader
  end

  get '/' do
    
    return erb(:home)
  end

  get '/peeps' do

    @peeps = Peep.all.order(created_at: :desc)

    return erb(:peeps)
  end
  
  get '/signup' do
    
    return erb(:signup)
  end

  get '/signin' do
    
    return erb(:signin)
  end

  post '/signup/new' do
    @user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    
    if @user.save 
      return erb(:signup_success)
    else 
      return erb(:signup_error)
    end
  end

  post '/signin' do
    email = params[:email]
    password = params[:password]

    @user = User.find_by_email(email)
    
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      session[:user] = @user

      redirect "/account/#{@user.id}"
    else
      return erb(:signin_error)
    end
  end

  get '/account/:id' do
    @user = session[:user] 
    if !!session[:user]
  
      return erb(:new_peep)
    end 
      return erb(:access_error)
  end

  post '/peep' do
    content = params[:content]
    if content.empty?

      redirect '/account/:id'
    else
      Peep.create!(content: content,
        user_id: session[:user_id],
        created_at: DateTime.now)
      
        redirect '/peeps'
    end
  end
end