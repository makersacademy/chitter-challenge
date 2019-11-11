ENV["RACK_ENV"] ||= "development"
#if not under rspec 'test' then set it to 'development'

require 'data_mapper'
require 'sinatra'
require 'dm-postgres-adapter'
require_relative '../db/data_mapper_setup'
#don't need to run it thou....
require_relative '../lib/user'
require_relative '../lib/peep'
#above are moduls

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
    #specific user route
  end

  get '/user/:user_id' do
    # this is routing parameter
    @user = User.get(params[:user_id])
    # this is from user.id from last route
    erb :"/user/home"
  end

  get '/user/:user_id/peep/new' do
    @user = User.get(params[:user_id])
    # from the <% @user.id %>
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



  run! if app_file == $0
end
