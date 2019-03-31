require 'sinatra/base'
require 'pg'
require_relative 'lib/cheep'
require_relative 'lib/user'

class ChitterApp < Sinatra::Base

  get '/' do
    @posts = Cheep.all
    erb :index
  end

  post '/post' do
    Cheep.post(params[:content])
    redirect '/'
  end

  get '/user/sign_up' do
    erb :'user/sign_up'
  end

  post '/user/sign_up' do
    user = User.create(params[:name], params[:username], params[:email], params[:password])
    redirect "/user/#{user.id}"
  end

  post '/user/sign_in' do
    user = User.sign_in(params['username'], params['password'])
    redirect "/user/#{user.id}"
  end

  get '/user/:id' do
    @posts = Cheep.all
    @user = User.find(params[:id])
    erb :'user/home'
  end


  run! if app_file == $0
end
