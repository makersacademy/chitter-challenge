ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    @user = User.new
    erb(:sign_up)
  end

  post '/users' do
    p params
    @user = User.create(name:  params[:name], username: params[:username],
    email: params[:email], password: params[:password],
    password_confirmation: params[:password_confirmation])

    session[:user_id] = @user.id
    @user.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:new_peep)
  end

  post '/peeps' do
    p params
    peep = Peep.create(name: current_user.name, username: current_user.username,
     user_id: current_user.id,
     message: params[:message])
    peep.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
