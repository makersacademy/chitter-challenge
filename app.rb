require 'sinatra/base'
require './lib/chitter'
require './lib/user'

class ChitterChallenge < Sinatra::Base
  enable :sessions, :method_override
  

  get '/' do
    "Chitter Challenge!"
  end

  get '/chitter' do

    @chitters = Chitter.all
    erb :index
  end

  get '/chitter/new' do
    erb :new
  end

  post '/chitter' do
  Chitter.create(peep: params['peep'])
  redirect '/chitter'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  User.create(email: params[:email], password: params[:password], username: params[:username], name: params[:name])
  session[:user_id]= user.id
  redirect '/chitter'
end


  run if app_file == $0
end
