require 'sinatra/base'
require './app/models/data_mapper_setup'
ENV['RACK_ENV'] ||= 'development'


class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/log-in' do
    erb :'users/log-in'
  end

  get '/users/sign-up' do
    erb :'users/sign-up'
  end

  post '/users/chitter-signup' do
    User.create(username:              params['username'],
                email:                 params['email'],
                password:              params['password'],
                password_confirmation: params['password_confirmation'])
    redirect('/main/peeps')
  end

  get '/main/peeps' do
    'peeps'
  end
  get 'confirmpassword' do
    'Please confirm password'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
