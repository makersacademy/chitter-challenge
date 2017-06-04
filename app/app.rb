ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'data_mapper'
require_relative './models/user'
require_relative './models/peep'
require_relative 'data_mapper_setup'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:signup)
  end

  post '/' do
    @user = User.create(name: params[:newuser_name], username: params[:newuser_username],
          email: params[:newuser_email], password: params[:newuser_password])
    redirect '/login'
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    @user = User.all(username: params[:user_name], password: params[:user_password])
    session[:id] = @user.first.id
    redirect '/profile'
  end

  get '/profile' do
    @user = User.all(id: session[:id]).first
    erb(:profile)
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/profile/peep' do
    erb(:peep)
  end

  post '/profile/peep' do
    user = User.all(id: session[:id]).first
    user.peeps.create(content: params[:peep])
    redirect '/profile/mypeeps'
  end

  get '/profile/mypeeps' do
    @peeps = Peep.all(Peep.user.id => session[:id])
    erb(:my_peeps)
  end

  get '/feed' do
    erb(:feed)
  end
end
