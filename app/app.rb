require 'sinatra/base'
require 'database_cleaner'
require 'bcrypt'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base

  ENV["RACK_ENV"] ||= 'development'

  include BCrypt
  enable :sessions
  data_mapper_config

  get '/' do
    redirect('/log_in')
  end

  get '/log_in' do
    session['user'] = nil
    erb :log_in
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    password_digest = Password.create(params[:Password])
    User.create(email: params[:Email], username: params[:Username], name: params[:Name], password_digest: password_digest, )
    redirect('/log_in')
  end

  post '/log_in' do
    session['user'] = User.first(:username => params[:Username])
    redirect('/homepage')
  end

  get '/homepage' do
    @user = session['user']
    erb :homepage
  end

  run! if app_file == $0

end
