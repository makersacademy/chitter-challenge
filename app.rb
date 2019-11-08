require 'sinatra'
require './lib/peep'
require './lib/DBhelper'
require './lib/user'


class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    "Hello World"
  end

  get '/home' do
    @user = session[:user]
    @posts = Peep.get
    erb :home
  end

  get '/login' do
    erb :login
  end

  get '/new_peep' do
    erb :new_peep
  end

  get '/error' do
    "error"
  end
  
  get '/success' do
    "success"
  end

  post '/redirect/new_peep' do
    title = params[:title]
    body = params[:body]

    DBhelper.new_peep(Peep.new(title, body))
    redirect '/home'
  end

  post '/redirect/check_user' do
    username = params[:username]
    password = params[:password]

    user = User.get_user(username)

    begin
      if password == user[0].password
        session[:user] = user[0]
        redirect '/home'
      end
    
    rescue
      redirect '/error'
    end
  end
end
