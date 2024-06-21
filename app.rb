require 'sinatra'
require 'pg'
require 'securerandom'
require_relative 'lib/peep'
require_relative 'lib/user'

DatabaseConnection.connect

class Application < Sinatra::Base

  configure do
    # session helps you to keep you logged even if you accidentaly close your tab
    enable :sessions
  end

  get '/' do
    @peeps = Peep.all
    erb( :index)
  end

  get '/signup' do
    erb :signup, locals: { error_message: "" }
    #locals created local variables inside html
  end

  post '/signup' do
    username = params[:username]
    email = params[:email]
    password = params[:password]
    User.create(username, email, password)

    redirect '/'
  end

  get '/login' do
    erb :login, locals: { error_message: "" }
  end

  post '/login' do
    email = params[:email]
    password = params[:password]
    user = User.find_by_email(email)
    if user && user.password == password
      session[:user_id] = user.id
      redirect '/'
    else
      erb :login, locals: { error_message: "Invalid email or password" }
    end
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  post '/peeps' do
    text = params[:text]
    user_id = session[:user_id]
    if user_id
      Peep.create(text, user_id)
      redirect '/'
    else
      erb :login, locals: { error_message: "You need to be logged in to peep" }
    end
  end 
end