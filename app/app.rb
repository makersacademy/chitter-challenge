ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup.rb'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  get '/home' do
    erb :home
  end

  post '/home' do
    User.create(email: params[:email], password: params[:password])
    redirect '/home'
  end

  get '/home/sign-up' do
    erb :signup
  end

  run! if app_file == $0
end
