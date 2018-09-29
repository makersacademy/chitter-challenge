require 'sinatra'
require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/post' do
    Peep.create peep: params[:peep], created_at: Time.now, user_id: session[:user]
    redirect '/'
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    session[:user] = params['username']
    User.create user: params['username'], firstname: params['firstname'], lastname: params['lastname'], email: params['email'], password: params[:password]
    redirect '/'
  end

end
