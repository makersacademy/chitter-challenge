ENV["RACK_ENV"] ||= "development"

require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'dm-postgres-adapter'
require_relative '../db/data_mapper_setup'
require_relative '../lib/user'
require_relative '../lib/peep'


class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :"/user/new"
  end

  post '/user/new' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    redirect "/user/#{user.id}"
  end

  get '/user/:user_id' do
    @user = User.get(params[:user_id])
    erb :"/user/home"
  end

  get '/user/:user_id/peep/new' do
    @user = User.get(params[:user_id])
    erb :"/peep/new"  
  end

  post '/user/:user_id/peep/new' do
    user = User.get(params[:user_id])
    user.peeps.create(message: params[:message])
    redirect "/peeps"
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :"/peep/all"
  end

  get '/user' do
    @users = User.all
    erb :"/user/all"
  end

  run! if app_file == $0
end
