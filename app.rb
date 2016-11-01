require 'sinatra/base'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'models/datamapper_setup'

ENV['RACK_ENV'] ||= 'development'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/home'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/new-user' do
    User.new_user_create(params[:name], params[:username], params[:email], params[:password])
    session["username"] = params[:username] if User.redirect == '/home'
    redirect User.redirect
  end

  get '/login' do
    erb :login
  end

  post '/user-login' do
    username = User.login_check(params[:username], params[:password])
    session["username"] = username
    redirect User.redirect
  end

  get '/home' do
    erb session["username"].nil? ? :logged_out : :logged_in
  end

  get '/failed-login' do
    erb :sorry_sign_up
  end

  post '/logout' do
    session["username"] = nil
    redirect '/home'
  end

  post '/peep' do
    Peep.create(user: User.first(username: session["username"]), time: Time.new, text: params[:peep])
    redirect '/home'
  end

  get '/re-signup' do
    erb :re_signup
  end

  get '/re-login' do
    erb :re_login
  end

  get '/psswrd-error' do
    erb :psswrd_error
  end

  run! if app_file == $0
end
