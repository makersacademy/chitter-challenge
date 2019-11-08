require 'sinatra'
require './lib/peep'
require './lib/DBhelper'
require './lib/user'
require 'digest/md5'


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

  get '/create_account' do
    @emptybox = session[:emptybox]
    erb :create_account
  end

  get '/new_peep' do
    @user = session[:user]
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
    username = session[:user].username

    DBhelper.new_peep(Peep.new(title, body,username))
    redirect '/home'
  end

  post '/redirect/check_user' do
    username = params[:username]
    password = Digest::MD5.new << params[:password]

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

  post '/redirect/create_account' do
    username = params[:username]
    password = params[:password]
    password2 = params[:password2]
    email = params[:email]

    if username.empty? or password.empty? or password2.empty?or email.empty?
      session[:emptybox] = true
      redirect '/create_account'
    else
      session[:emptybox] = false
      if password == password2
        DBhelper.create_account(username,password,email)
        redirect '/home'
      else
        redirect '/create_account'
      end
    end
  end
end
