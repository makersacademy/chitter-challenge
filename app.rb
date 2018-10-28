require 'sinatra/base'
require './lib/user'

class App < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    #check user.unique? if false redirect :homepage
    User.sign_up(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], password: params['password'], username: params['username'])
    redirect '/signed_in'
  end

  post '/new_peep' do
    redirect '/signed_in'
  end

  get '/signed_in' do
    @name = User.first_name
    erb :signed_in_homepage
  end

  run! if app_file == $0

end
