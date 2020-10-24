require 'sinatra/base'
require 'pg'
require './lib/peep.rb'

class Chitter < Sinatra::Base  
  enable :sessions
  attr_reader :username, :peeps
  
  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @username = session[:username]
    @peeps = Peep.all
    erb :'peeps/index' 
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:Peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    p params
    session[:username] = params[:username]
    redirect '/peeps'
  #  User.create(username: params[:username], name: params[:name], password: params[:psw])
end


  run! if app_file == $0
end
