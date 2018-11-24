require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/peep.rb'
require 'time'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:homepage)
  end

  post '/peep/new' do
    @user = User.find(session[:user_id])

    if @user == nil
    @user = User.register(name: 'Faceless Old Woman', \
      user_name: 'FacelessOW', email: 'mystery@domain.com', \
      password: '123456789')
    end
    Peep.create(userid: @user.id, timestamp: Time.now, \
      content: params[:peep_content], threadpeep: params[:peep_content])

    redirect '/homepage'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.register(name: params[:name], user_name: params[:user_name], \
      email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/homepage'
  end

  run! if app_file == $0
end
