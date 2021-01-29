require 'sinatra'
require 'sinatra/base'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base

  get '/feed' do 
    erb :feed
  end

  post '/feed' do
    redirect('/feed')
  end

  run! if app_file == $PROGRAM_NAME
end