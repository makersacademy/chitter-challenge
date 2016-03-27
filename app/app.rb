require 'sinatra/base'
ENV['RACK_ENV'] = 'development'
require_relative './models/data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    redirect '/peeps'
  end

  get '/peeps' do
    'List of all peeps to go here:'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
