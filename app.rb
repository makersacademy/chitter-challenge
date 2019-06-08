require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'active_support/core_ext/integer/inflections'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'data_mapper_setup'
require 'bcrypt'




class Chitter < Sinatra::Base
  
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/peeps' if session[:user_id]
    @error = flash[:login]
    erb :index
  end

  post '/login' do
    user = User.first({username: params[:username]})
    invalid_username unless user
    invalid_password unless user.password == params[:password]
    login(user.id)
  end

  get '/post' do
    check_login
    @peep_id = params[:peep_id]
    erb :post
  end

  get '/peeps' do
    @peeps = Peep.reverse
    erb :peeps
  end

  post '/post' do
    check_login
    params[:peep_id] = nil if params[:peep_id].empty?
    Peep.create(text: params[:text], created_at: Time.now, user_id: session[:user_id], peep_id: params[:peep_id])
    redirect('/peeps')
  end

  get '/register' do
    erb :register 
  end

  post '/register' do
    User.create(username: params[:username], password: params[:password])
    redirect '/'
  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  def login(user_id)
    session[:user_id] = user_id
    redirect '/peeps'
  end

  def check_login
    not_logged_in unless session[:user_id]
  end
    
  def invalid_username
    flash[:login] = 'Error: invalid username'
    redirect '/'
  end

  def invalid_password
    flash[:login] = 'Error: invalid password'
    redirect '/'
  end

  def not_logged_in
    flash[:login] = 'Error: not logged in'
    redirect('/')
  end

  run! if app_file == $0
end