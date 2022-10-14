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
    @user = session[:user]
    @peeps = Peep.order(created_at: :desc).first(5)
    
    return erb(:index)
  end

  get '/peeps' do
    @user = session[:user]
    @peeps = Peep.all.order(created_at: :desc)

    return erb(:peeps)
  end
  
  get '/signup' do
    if signin?
      @user = session[:user]
      return erb(:signned_in_error)
    end
    return erb(:signup)
  end

  get '/signin' do
    if signin?
      @user = session[:user]
      return erb(:signned_in_error)
    end
    return erb(:signin)
  end

  get '/signout' do
    session.clear

    redirect '/'
  end

  get '/account/:id' do
    if signin?
      @user = session[:user]
  
      return erb(:new_peep)
    end 
      return erb(:access_error)
  end

  post '/signup' do
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

  post '/peep/new' do
    if signin?
      peep = Peep.create(
        content: params[:content],
        user_id: session[:user_id]
      )
      
      if !!peep.save
      redirect '/peeps'
      end
      return erb(:peep_error)
    end
    return erb(:access_error)
  end

  def signin?
    !!session[:user]
  end
end