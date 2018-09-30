require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require './lib/message'
require './lib/user'
require 'data_mapper'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    DataMapper.setup(:default, 'postgres://localhost:5432/chitter')
    DataMapper.finalize
    erb :homepage
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    flash[:error_signup] = "Username or password already in use!"
    redirect '/signup' if User.first(:username => params['username']) != nil
    redirect '/signup' if User.first(:email => params['email']) != nil
    User.create(
      :username       => params['username'],
      :email          => params['email'],
      :password       => params['password']
    )
    redirect '/'
  end

  post '/login' do
    attemped_login = User.first(:username => params['username'])
    if attemped_login == nil
      flash[:error_login] = "Sorry, unknown username or password!"
    elsif attemped_login['password'] == params['password']
      session['username'] = params['username']
      redirect 'messageboard'
    end
    redirect '/'
  end

  post '/message' do
    Message.create(
      :body       => params['message'],
      :userid     => 1,
      :time => Time.now
    )
    redirect '/messageboard'
  end

  get '/messageboard' do
    @username = session['username']
    @messageboard = Message.all(:order => [ :time.desc ])
    erb :messageboard
  end

  run! if app_file == $0
end
