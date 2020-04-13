require 'sinatra/base'
require './lib/peeps.rb'
require './database_connection_setup.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])

    @messages = Peeps.all
    erb :index
  end

  post '/' do 
    peep = params[:peep]
    Peeps.add(peep)
    redirect('/')
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], 
      username: params[:username], name: params[:name])

    session[:user_id] = user.id
    redirect('/')
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
    user = User.new(result[0]['id'], result[0]['email'], result[0]['password'], 
                    result[0]['username'], result[0]['name'])

    session[:user_id] = user.id
    redirect('/bookmarks')
  end
end
