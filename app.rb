require 'sinatra/base'
require './lib/user'
require 'pry'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    session[:unique] = true
    erb :homepage
  end

  get '/sign_up' do
    @unique_user = session[:unique]
    erb :sign_up
  end

  post '/sign_up' do
    if User.unique?(params['username'], params['email'])
      User.sign_up(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], password: params['password'], username: params['username'])
      redirect '/signed_in'
    else
      session[:unique] = false
      redirect '/sign_up'
    end
  end

  get '/signed_in' do
    @name = User.first_name
    erb :signed_in_homepage
  end

  post '/new_peep' do
    redirect '/signed_in'
  end

  run! if app_file == $0

end
