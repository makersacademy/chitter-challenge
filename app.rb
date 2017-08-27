ENV["RACK_ENV"] ||= "development"
require_relative './models/data_mapper_setup.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/home' do
    erb :home
  end

  post '/home' do
    redirect to ('/new_post')
  end

end
