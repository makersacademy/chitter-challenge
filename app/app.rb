ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_setup'


class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/signup'
  end

  post '/users' do
    redirect to '/peeps'
  end

  get '/peeps' do

  end
end
