ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'pry'
require_relative './models/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @user = session[:user] unless session[:user].nil?
    @peeps = Peep.all
    erb :index
  end

  post '/sign-up' do
    erb :sign_up
  end

  post '/sign-up/complete' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/'
  end

  post '/login' do
    erb :login
  end

  post '/login/success' do
    user = User.authenticate(params[:username], params[:password])
    session[:user] = user.username
    redirect '/'
  end

  post '/logout' do
    session[:user] = nil
    redirect to '/'
end

  post '/post-peep' do
    user = User.first(username: session[:user])
    new_peep = Peep.create(post: params[:peep_text], time: Time.new.strftime("%H:%M:%S %d-%m-%Y"))
    user.peeps << new_peep
    user.save
    redirect '/'
  end

end
